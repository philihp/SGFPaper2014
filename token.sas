
/*

%let client_id=353928234660582;
%let client_secret=;
%let amp=%str(&);

filename token "/tmp/token.json";
filename response "/tmp/header.txt";

%put =============================;
%put https://www.facebook.com/dialog/oauth?client_id=353928234660582&amp.redirect_uri=https%3A%2F%2Fphilihp.com;
%put =============================;

proc http
  method="get"
  url="https://www.facebook.com/dialog/oauth?client_id=353928234660582&amp.redirect_uri=https%3A%2F%2Fphilihp.com"
  out=token
  headerout=response
;
run;


  url="https://www.facebook.com/dialog/oauth?client_id=353928234660582&amp;redirect_uri=https%3A%2F%2Fwww.facebook.com/connect/login_success.html"

data _null_;
  infile token;
  length line $200;
  input line $;
run;
  url="https://graph.facebook.com/oauth/access_token?client_id=&client_id.&amp.client_secret=&client_secret.&amp.grant_type=client_credentials"

https://www.facebook.com/connect/login_success.html?code=AQChsLy5LJx_xdnUhYF0nJWS0NPh5eu58hTWW9DO-PRvie-PN68589b6vtJciB_XH25mGRYuSJMyzuN1Hz-EBlSNCurW_jAbWl2uqQx_P5OfYZgZpQ4zrGbyxpF9fYwmQ4t0IgYK1kz-wIK-Bz0EXfeZLRWxIAEmzhxDegAgro8PI-bKLr38VZORbaSFItI_00ctDNwSTvGpuMkLWva0BbVOG3jsXSpV-nMmjKSTbHT6wi8xTgwOEZCnR-2eXwzPqPV-Rc4oxhwn6uCOzvajNASZpQjEiv1tWlo2G6PaXvoKHcTacq2dtUUHdweAwVvPJfY#_=_


*/

%let token=CAACEdEose0cBALTLbHZA5Le2afZAnWDyg1letNLQ7ITsCi5nvzgxSIenOMtr6GJOrYu0ZCNms0rlkFdA6QYx20QfQslFR0C3OjKDI5IeoS16YuZBZBbjgQ47vqEDBniTM1NozAIb2F43G15VVtXzuXQ8p3ZB1ZB5vIHAzWwERWcTt0LkZANss1O4LbueWgnOdftXWWnZCAq6QmAZDZD;