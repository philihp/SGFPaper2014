
x 'python facepull.py';
filename csv '/tmp/python.csv';

data friends;
    infile csv missover dsd firstobs=2 ;
    informat id $50. name $100.;
    input name $ id $;
run;
