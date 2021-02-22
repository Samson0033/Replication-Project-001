options memory=18;
noprint;
supres @smpl;
options limwarn=0;
freq n;
smpl 1 3782;
? 3782 is 62 * 61;

read(file='trade62.dat') codesj trade;
read(file='dist62.dat') codesj dist adj;
read(file='var62i.dat') codei gdpi locki worki areai;
read(file='var62j.dat') codej gdpj lockj workj areaj;

genr trdsh = trade / gdpi; genr ltrdsh = log(trdsh);

genr lworki = log(worki);
genr lworkj = log(workj);
genr lareai = log(areai);
genr lareaj = log(areaj);
genr ldist = log(dist);
genr adjdist = adj * ldist;
genr lockij = locki + lockj;
genr adjlij = adj * lockij;
genr adjworki = adj * lworki;
genr adjworkj = adj * lworkj;
genr adjareai = adj * lareai;
genr adjareaj = adj * lareaj;

olsq ltrdsh c ldist lworki lareai lworkj lareaj lockij 
adj adjdist adjworki adjareai adjworkj adjareaj adjlij;
unmake @coef b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 
b11 b12 b13;

smpl 1 26082;
? 162 countries
? 26082 is 162 * 161;
read(file='dist162.dat') codesj dist adj;
read(file='var162i.dat') codei locki worki areai;
read(file='var162j.dat') codej lockj workj areaj;

genr lworki = log(worki);
genr lworkj = log(workj);
genr lareai = log(areai);
genr lareaj = log(areaj);
genr ldist = log(dist);
genr adjdist = adj * ldist;
genr lockij = locki + lockj;
genr adjlij = adj * lockij;
genr adjworki = adj * lworki;
genr adjworkj = adj * lworkj;
genr adjareai = adj * lareai;
genr adjareaj = adj * lareaj;

genr lftrdsh = b0 + b1*ldist + b2*lworki + b3*lareai + 
b4*lworkj + b5*lareaj + b6*lockij + b7*adj + 
b8*adjdist + b9*adjworki + b10*adjareai + b11*adjworkj + b12*adjareaj + b13*adjlij;

genr ftrdsh = exp(lftrdsh);

smpl 1 26082;
trend(period=161) country;
? 162 countries each with 161 trading partners
smplif country=161;
genr geogt = (ftrdsh + ftrdsh(-1) + ftrdsh(-2) + 
ftrdsh(-3) + ftrdsh(-4) + ftrdsh(-5) + ftrdsh(-6) + ftrdsh(-7) + 
ftrdsh(-8) + ftrdsh(-9) + ftrdsh(-10) + ftrdsh(-11) + 
ftrdsh(-12) + ftrdsh(-13) + ftrdsh(-14) + ftrdsh(-15) + 
ftrdsh(-16) + ftrdsh(-17) + ftrdsh(-18) + ftrdsh(-19) + 
ftrdsh(-20) + ftrdsh(-21) + ftrdsh(-22) + ftrdsh(-23) + 
ftrdsh(-24) + ftrdsh(-25) + ftrdsh(-26) + ftrdsh(-27) + 
ftrdsh(-28) + ftrdsh(-29) + ftrdsh(-30) + ftrdsh(-31) + 
ftrdsh(-32) + ftrdsh(-33) + ftrdsh(-34) + ftrdsh(-35) + 
ftrdsh(-36) + ftrdsh(-37) + ftrdsh(-38) + ftrdsh(-39) + 
ftrdsh(-40) + ftrdsh(-41) + ftrdsh(-42) + ftrdsh(-43) + 
ftrdsh(-44) + ftrdsh(-45) + ftrdsh(-46) + ftrdsh(-47) + 
ftrdsh(-48) + ftrdsh(-49) + ftrdsh(-50) + ftrdsh(-51) + 
ftrdsh(-52) + ftrdsh(-53) + ftrdsh(-54) + ftrdsh(-55) + 
ftrdsh(-56) + ftrdsh(-57) + ftrdsh(-58) + ftrdsh(-59) + 
ftrdsh(-60) + ftrdsh(-61) + ftrdsh(-62) + ftrdsh(-63) + 
ftrdsh(-64) + ftrdsh(-65) + ftrdsh(-66) + ftrdsh(-67) + 
ftrdsh(-68) + ftrdsh(-69) + ftrdsh(-70) + ftrdsh(-71) + 
ftrdsh(-72) + ftrdsh(-73) + ftrdsh(-74) + ftrdsh(-75) + 
ftrdsh(-76) + ftrdsh(-77) + ftrdsh(-78) + ftrdsh(-79) + 
ftrdsh(-80) + ftrdsh(-81) + ftrdsh(-82) + ftrdsh(-83) + 
ftrdsh(-84) + ftrdsh(-85) + ftrdsh(-86) + ftrdsh(-87) + 
ftrdsh(-88) + ftrdsh(-89) + ftrdsh(-90) + ftrdsh(-91) + 
ftrdsh(-92) + ftrdsh(-93) + ftrdsh(-94) + ftrdsh(-95) + 
ftrdsh(-96) + ftrdsh(-97) + ftrdsh(-98) + ftrdsh(-99) + 
ftrdsh(-100) + ftrdsh(-101) + ftrdsh(-102) + ftrdsh(-103) + 
ftrdsh(-104) + ftrdsh(-105) + ftrdsh(-106) + ftrdsh(-107) + 
ftrdsh(-108) + ftrdsh(-109) + ftrdsh(-110) + ftrdsh(-111) + 
ftrdsh(-112) + ftrdsh(-113) + ftrdsh(-114) + ftrdsh(-115) + 
ftrdsh(-116) + ftrdsh(-117) + ftrdsh(-118) + ftrdsh(-119) + 
ftrdsh(-120) + ftrdsh(-121) + ftrdsh(-122) + ftrdsh(-123) +
ftrdsh(-124) + ftrdsh(-125) + ftrdsh(-126) + ftrdsh(-127) + 
ftrdsh(-128) + ftrdsh(-129) + ftrdsh(-130) + ftrdsh(-131) + 
ftrdsh(-132) + ftrdsh(-133) + ftrdsh(-134) + ftrdsh(-135) + 
ftrdsh(-136) + ftrdsh(-137) + ftrdsh(-138) + ftrdsh(-139) + 
ftrdsh(-140) + ftrdsh(-141) + ftrdsh(-142) + ftrdsh(-143) + 
ftrdsh(-144) + ftrdsh(-145) + ftrdsh(-146) + ftrdsh(-147) + 
ftrdsh(-148) + ftrdsh(-149) + ftrdsh(-150) + ftrdsh(-151) + 
ftrdsh(-152) + ftrdsh(-153) + ftrdsh(-154) + ftrdsh(-155) + 
ftrdsh(-156) + ftrdsh(-157) + ftrdsh(-158) + ftrdsh(-159) + 
ftrdsh(-160)) *1000 * 100;

print codesj geogt;

