noprint;
supres @smpl;
options limwarn=0;
freq n;
smpl 1 150;
read(file='geog150.dat') codesj geogt;
read(file='info150.dat') code1 gdpw85 gdpw60 avinv 
ngdelta avsch open;
read(file='popwork150.dat') code pop work;
read(file='area150.dat') code area;

genr lwork = log(work);
genr larea = log(area);

olsq open c geogt;

olsq open c geogt lwork larea;


