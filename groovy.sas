
%include token;
/* http://blogs.sas.com/content/sascom/2013/12/12/how-to-import-twitter-tweets-in-sas-data-step-using-oauth-2-authentication-style/ */

data _null_;
  fname='fh';
  rc=filename(fname,'/tmp/groovy.csv');
  if(rc=0 and fexist(fname)) then
    rc=fdelete(fname);
  rc=filename(fname);
run;
filename csv '/tmp/groovy.csv';
data _null_;
  file csv;
  put 'id,updated_time,message';
run;

filename headers '/tmp/headers.txt';
filename out "/tmp/http.json";
data _null_;
  file headers;
  put "Authorization: OAuth &token";
run;

%macro pullpage();
%put TOPULL=&topull;
%if %length(&topull) ^= 0 %then %do;
proc http
  method="get"
  headerin=headers
  url="&topull."
  out=out
;
run;
proc groovy;
  /* http://repository.codehaus.org/org/codehaus/groovy/groovy-all/1.8.6/ */
  add classpath="/usr/share/groovy/lib/groovy-1.8.6.jar";
  exec "json2csv.groovy";
quit;
%end;
%mend;
%macro puller();
%let topull=https://graph.facebook.com/11803542/statuses;
%do %while(%length(&topull) ^= 0);
  %pullpage;
%end;
%mend;
%puller;

data statuses;
    infile csv missover dsd firstobs=2 ;
    informat id $50. updated_str $24. message $400.;
    input id $ updated_str $ message $;
    updated_time = input(substr(updated_str,1,22)||':'||substr(updated_str,23), e8601dz.);
    format updated_time datetime20.;
    drop updated_str;
run;
