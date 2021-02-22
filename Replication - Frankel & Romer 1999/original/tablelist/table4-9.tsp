noprint;
supres @smpl;
options limwarn=0;
freq n;
smpl 1 98;

read(file='allgeog98.dat') codesj geogt geog1 geog2 
geog3 geog4 geog5 geog6 geog7 geog8 geog9 
geog10 geog11 geog12 geog13 geog14;
read(file='area98.dat') code area;
read(file='popwork98.dat') code pop work;
read(file='info98.dat') code1 code2 code3 
gdpw85 gdpw60 avinv ngdelta avsch open;
read(file='hj98.dat') code1 code2 alnky phis lna;

genr lwork = log(work);
genr larea = log(area);
genr lgdpw85 = log(gdpw85);
genr lgdpw60 = log(gdpw60);
genr lgrow = lgdpw85 - lgdpw60;

olsq lgrow c open lwork larea;
inst lgrow c open lwork larea invr c geogt lwork larea;
unmake @coef b0 b1 b2 b3;
copy @vcov sigma;

inst lgrow c open lwork larea invr c geog1 lwork larea;
unmake @coef b0g1 b1g1 b2g1 b3g1;

inst lgrow c open lwork larea invr c geog2 lwork larea;
unmake @coef b0g2 b1g2 b2g2 b3g2;

inst lgrow c open lwork larea invr c geog3 lwork larea;
unmake @coef b0g3 b1g3 b2g3 b3g3;

inst lgrow c open lwork larea invr c geog4 lwork larea;
unmake @coef b0g4 b1g4 b2g4 b3g4;

inst lgrow c open lwork larea invr c geog5 lwork larea;
unmake @coef b0g5 b1g5 b2g5 b3g5;

inst lgrow c open lwork larea invr c geog6 lwork larea;
unmake @coef b0g6 b1g6 b2g6 b3g6;

inst lgrow c open lwork larea invr c geog7 lwork larea;
unmake @coef b0g7 b1g7 b2g7 b3g7;

inst lgrow c open lwork larea invr c geog8 lwork larea;
unmake @coef b0g8 b1g8 b2g8 b3g8;

inst lgrow c open lwork larea invr c geog9 lwork larea;
unmake @coef b0g9 b1g9 b2g9 b3g9;

inst lgrow c open lwork larea invr c geog10 lwork larea;
unmake @coef b0g10 b1g10 b2g10 b3g10;

inst lgrow c open lwork larea invr c geog11 lwork larea;
unmake @coef b0g11 b1g11 b2g11 b3g11;

inst lgrow c open lwork larea invr c geog12 lwork larea;
unmake @coef b0g12 b1g12 b2g12 b3g12;

inst lgrow c open lwork larea invr c geog13 lwork larea;
unmake @coef b0g13 b1g13 b2g13 b3g13;

inst lgrow c open lwork larea invr c geog14 lwork larea;
unmake @coef b0g14 b1g14 b2g14 b3g14;


? first column of db/da

db1da1 = (b0g1 - b0)/0.001;
db1da2 = (b0g2 - b0)/0.001;
db1da3 = (b0g3 - b0)/0.001;
db1da4 = (b0g4 - b0)/0.001;
db1da5 = (b0g5 - b0)/0.001;
db1da6 = (b0g6 - b0)/0.001;
db1da7 = (b0g7 - b0)/0.001;
db1da8 = (b0g8 - b0)/0.001;
db1da9 = (b0g9 - b0)/0.001;
db1da10 = (b0g10 - b0)/0.001;
db1da11 = (b0g11 - b0)/0.001;
db1da12 = (b0g12 - b0)/0.001;
db1da13 = (b0g13 - b0)/0.001;
db1da14 = (b0g14 - b0)/0.001;

? second column

db2da1 = (b1g1 - b1)/0.001;
db2da2 = (b1g2 - b1)/0.001;
db2da3 = (b1g3 - b1)/0.001;
db2da4 = (b1g4 - b1)/0.001;
db2da5 = (b1g5 - b1)/0.001;
db2da6 = (b1g6 - b1)/0.001;
db2da7 = (b1g7 - b1)/0.001;
db2da8 = (b1g8 - b1)/0.001;
db2da9 = (b1g9 - b1)/0.001;
db2da10 = (b1g10 - b1)/0.001;
db2da11 = (b1g11 - b1)/0.001;
db2da12 = (b1g12 - b1)/0.001;
db2da13 = (b1g13 - b1)/0.001;
db2da14 = (b1g14 - b1)/0.001;

? third column

db3da1 = (b2g1 - b2)/0.001;
db3da2 = (b2g2 - b2)/0.001;
db3da3 = (b2g3 - b2)/0.001;
db3da4 = (b2g4 - b2)/0.001;
db3da5 = (b2g5 - b2)/0.001;
db3da6 = (b2g6 - b2)/0.001;
db3da7 = (b2g7 - b2)/0.001;
db3da8 = (b2g8 - b2)/0.001;
db3da9 = (b2g9 - b2)/0.001;
db3da10 = (b2g10 - b2)/0.001;
db3da11 = (b2g11 - b2)/0.001;
db3da12 = (b2g12 - b2)/0.001;
db3da13 = (b2g13 - b2)/0.001;
db3da14 = (b2g14 - b2)/0.001;

? fourth column

db4da1 = (b3g1 - b3)/0.001;
db4da2 = (b3g2 - b3)/0.001;
db4da3 = (b3g3 - b3)/0.001;
db4da4 = (b3g4 - b3)/0.001;
db4da5 = (b3g5 - b3)/0.001;
db4da6 = (b3g6 - b3)/0.001;
db4da7 = (b3g7 - b3)/0.001;
db4da8 = (b3g8 - b3)/0.001;
db4da9 = (b3g9 - b3)/0.001;
db4da10 = (b3g10 - b3)/0.001;
db4da11 = (b3g11 - b3)/0.001;
db4da12 = (b3g12 - b3)/0.001;
db4da13 = (b3g13 - b3)/0.001;
db4da14 = (b3g14 - b3)/0.001;

smpl 1 1;

print db1da1 db1da2 db1da3 db1da4 db1da5 db1da6 db1da7 db1da8 db1da9 db1da10 db1da11 db1da12 db1da13 db1da14;
print db2da1 db2da2 db2da3 db2da4 db2da5 db2da6 db2da7 db2da8 db2da9 db2da10 db2da11 db2da12 db2da13 db2da14;
print db3da1 db3da2 db3da3 db3da4 db3da5 db3da6 db3da7 db3da8 db3da9 db3da10 db3da11 db3da12 db3da13 db3da14;
print db4da1 db4da2 db4da3 db4da4 db4da5 db4da6 db4da7 db4da8 db4da9 db4da10 db4da11 db4da12 db4da13 db4da14;

