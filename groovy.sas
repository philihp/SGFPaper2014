%let token1=CAAFB5Vaz8uYBAPC7u5C2XIf3Wd7VRZA2bLei2dDzVGKrGsAtc5i9MZBXHFHuBBhBg;
%let token2=kqChXI6swLgkKlR9EE56Jw49sM66ZBisF4rzCHfAEq27lNcpi0xQPIzu4dLciDD9QW;
%let token3=BdiZB68ZBZBLm8o0ZBrfpCdqDg6RECZCUYK5lCMWomd1bblJwb6UlNBCaRNXSg78ZD;
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

proc groovy;
	submit;
        import groovy.json.*
        def input=new File('c:/temp/out.txt').text
        def output = new JsonSlurper().parseText(input)
        println output    
	endsubmit;
quit;
