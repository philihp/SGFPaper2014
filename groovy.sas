/* http://blogs.sas.com/content/sascom/2013/12/12/how-to-import-twitter-tweets-in-sas-data-step-using-oauth-2-authentication-style/ */

data _null_;
  fname='fh';
  rc=filename(fname,'c:\temp\out.csv');
  if(rc=0 and fexist(fname)) then
    rc=fdelete(fname);
  rc=filename(fname);
run;


filename headers 'c:\temp\headers.txt';

/* prefer to put in access token into the headers, so we can use the paging next without mucking around with it */
%let token=CAACEdEose0cBAP82Xzxtub0FyKBYwIf3H7sci8bEhk8XG5V7B9QAS4yvzfaUwi9D5Yl34ySrNChPkZAq5ygNZCn3l4SBu0RqD9hRtPr5tFdH7FOa2uMrnn1XURgp752hmWP60xPdBEoOwniI8BS0b7yv2tZBZBRZAngZAvOlAgBMe9XNoC86ajC2y7yyUiy40ZD;
filename out "c:\temp\out.txt";
data _null_;
  file headers;
  put "Authorization: OAuth &token";
run;
proc http
  method="get"
  headerin=headers
  url="https://graph.facebook.com/me?fields=statuses"
  out=out
  proxyhost="inetgw.unx.sas.com"
  proxyport=80
;
run;

proc groovy classpath="C:\git_local\SGFPaper2014\groovy-all-2.2.1.jar";
	submit;
        import groovy.json.*
        def input=new File('c:/temp/out.txt').text
        def json=new JsonSlurper().parseText(input)
		def output=new File('c:/temp/out.csv')
		output.append ['id','message'].join(',') + '\n';
        json.statuses.data.each {
			def row = [it.id, it.message]
			output.append row.join(',') + '\n'
		}
		next = json.statuses.paging.next;
		print next
	endsubmit;
quit;

proc import out=statuses datafile="c:\temp\out.csv"
  dbms=csv
  replace;
  getnames=yes;
  datarow=2;
run;
