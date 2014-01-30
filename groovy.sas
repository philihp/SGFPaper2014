%let token1=CAAFB5Vaz8uYBAK9fZAZAEVOwkai29WwGyZC2xEwSAXwWOhIEPQ6FakD78txVwdO9L;
%let token2=fwqSQfLFxqMsM0dJPFsD7pYhkeqPnCP8jJKZAZAkWDZBYh06ri1niIygEOSvQGTasN;
%let token3=4AyvGj9jslOZCg8z9wMEntFYOf5KBzlxJap1HU9nXoPuD19cx6UCS7zNzrJ45tYZD;
%let token=&token1.&token2.&token3;

filename out "c:\temp\out.txt";
proc http
  method="get"
  url="https://graph.facebook.com/me?access_token=&token%str(&)fields=statuses"
  out=out
  proxyhost="inetgw.unx.sas.com"
  proxyport=80
;
run;

proc groovy classpath="C:\git_local\SGFPaper2014\groovy-all-2.2.1.jar";
	submit;
        import groovy.json.*
        def input=new File('c:/temp/out.txt').text
        def output = new JsonSlurper().parseText(input)
        output.statuses.data.each {
			println it.message
			println '========'
		}
	endsubmit;
quit;
