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

olsq ltrdsh c ldist adj lockij lworki lworkj lareai lareaj 
adjdist adjlij adjworki adjworkj adjareai adjareaj;
unmake @coef b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 
b11 b12 b13;
copy @vcov omega;

print omega;

smpl 1 26082;
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

genr lftrdsh = b0 + b1*ldist + b2*adj + b3*lockij + 
b4*lworki + b5*lworkj + b6*lareai + b7*lareaj + 
b8*adjdist + b9*adjlij + b10*adjworki + b11*adjworkj + b12*adjareai + b13*adjareaj;

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

? adding 0.001 to the first element: c

smpl 1 26082;
b0new = b0 + 0.001;

genr lftrdsh = b0new + b1*ldist + b2*adj + b3*lockij + 
b4*lworki + b5*lworkj + b6*lareai + b7*lareaj + 
b8*adjdist + b9*adjlij + b10*adjworki + b11*adjworkj + b12*adjareai + b13*adjareaj;

genr ftrdsh = exp(lftrdsh);

smpl 1 26082;
trend(period=161) country;
? 162 countries each with 161 trading partners
smplif country=161;
genr geog1 = (ftrdsh + ftrdsh(-1) + ftrdsh(-2) + 
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


? adding 0.001 to the second element: ldist

smpl 1 26082;
b1new = b1 + 0.001;

genr lftrdsh = b0 + b1new*ldist + b2*adj + b3*lockij + 
b4*lworki + b5*lworkj + b6*lareai + b7*lareaj + 
b8*adjdist + b9*adjlij + b10*adjworki + b11*adjworkj + b12*adjareai + b13*adjareaj;

genr ftrdsh = exp(lftrdsh);

smpl 1 26082;
trend(period=161) country;
? 162 countries each with 161 trading partners
smplif country=161;
genr geog2 = (ftrdsh + ftrdsh(-1) + ftrdsh(-2) + 
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


? adding 0.001 to the third element: adj

smpl 1 26082;
b2new = b2 + 0.001;

genr lftrdsh = b0 + b1*ldist + b2new*adj + b3*lockij + 
b4*lworki + b5*lworkj + b6*lareai + b7*lareaj + 
b8*adjdist + b9*adjlij + b10*adjworki + b11*adjworkj + b12*adjareai + b13*adjareaj;

genr ftrdsh = exp(lftrdsh);

smpl 1 26082;
trend(period=161) country;
? 162 countries each with 161 trading partners
smplif country=161;
genr geog3 = (ftrdsh + ftrdsh(-1) + ftrdsh(-2) + 
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

? adding 0.001 to the fourth element: lockij

smpl 1 26082;
b3new = b3 + 0.001;

genr lftrdsh = b0 + b1*ldist + b2*adj + b3new*lockij + 
b4*lworki + b5*lworkj + b6*lareai + b7*lareaj + 
b8*adjdist + b9*adjlij + b10*adjworki + b11*adjworkj + b12*adjareai + b13*adjareaj;

genr ftrdsh = exp(lftrdsh);

smpl 1 26082;
trend(period=161) country;
? 162 countries each with 161 trading partners
smplif country=161;
genr geog4 = (ftrdsh + ftrdsh(-1) + ftrdsh(-2) + 
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

? adding 0.001 to the fifth element: lworki

smpl 1 26082;
b4new = b4 + 0.001;

genr lftrdsh = b0 + b1*ldist + b2*adj + b3*lockij + 
b4new*lworki + b5*lworkj + b6*lareai + b7*lareaj + 
b8*adjdist + b9*adjlij + b10*adjworki + b11*adjworkj + b12*adjareai + b13*adjareaj;

genr ftrdsh = exp(lftrdsh);

smpl 1 26082;
trend(period=161) country;
? 162 countries each with 161 trading partners
smplif country=161;
genr geog5 = (ftrdsh + ftrdsh(-1) + ftrdsh(-2) + 
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


? adding 0.001 to the sixth element: lworkj

smpl 1 26082;
b5new = b5 + 0.001;

genr lftrdsh = b0 + b1*ldist + b2*adj + b3*lockij + 
b4*lworki + b5new*lworkj + b6*lareai + b7*lareaj + 
b8*adjdist + b9*adjlij + b10*adjworki + b11*adjworkj + b12*adjareai + b13*adjareaj;

genr ftrdsh = exp(lftrdsh);

smpl 1 26082;
trend(period=161) country;
? 162 countries each with 161 trading partners
smplif country=161;
genr geog6 = (ftrdsh + ftrdsh(-1) + ftrdsh(-2) + 
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

? adding 0.001 to the seventh element: lareai

smpl 1 26082;
b6new = b6 + 0.001;

genr lftrdsh = b0 + b1*ldist + b2*adj + b3*lockij + 
b4*lworki + b5*lworkj + b6new*lareai + b7*lareaj + 
b8*adjdist + b9*adjlij + b10*adjworki + b11*adjworkj + b12*adjareai + b13*adjareaj;

genr ftrdsh = exp(lftrdsh);

smpl 1 26082;
trend(period=161) country;
? 162 countries each with 161 trading partners
smplif country=161;
genr geog7 = (ftrdsh + ftrdsh(-1) + ftrdsh(-2) + 
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

? adding 0.001 to the eighth element: lareaj

smpl 1 26082;
b7new = b7 + 0.001;

genr lftrdsh = b0 + b1*ldist + b2*adj + b3*lockij + 
b4*lworki + b5*lworkj + b6*lareai + b7new*lareaj + 
b8*adjdist + b9*adjlij + b10*adjworki + b11*adjworkj + b12*adjareai + b13*adjareaj;

genr ftrdsh = exp(lftrdsh);

smpl 1 26082;
trend(period=161) country;
? 162 countries each with 161 trading partners
smplif country=161;
genr geog8 = (ftrdsh + ftrdsh(-1) + ftrdsh(-2) + 
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

? adding 0.001 to the ninth element: adjdist

smpl 1 26082;
b8new = b8 + 0.001;

genr lftrdsh = b0 + b1*ldist + b2*adj + b3*lockij + 
b4*lworki + b5*lworkj + b6*lareai + b7*lareaj + 
b8new*adjdist + b9*adjlij + b10*adjworki + b11*adjworkj + b12*adjareai + b13*adjareaj;

genr ftrdsh = exp(lftrdsh);

smpl 1 26082;
trend(period=161) country;
? 162 countries each with 161 trading partners
smplif country=161;
genr geog9 = (ftrdsh + ftrdsh(-1) + ftrdsh(-2) + 
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

? adding 0.001 to the tenth element: adjlij

smpl 1 26082;
b9new = b9 + 0.001;

genr lftrdsh = b0 + b1*ldist + b2*adj + b3*lockij + 
b4*lworki + b5*lworkj + b6*lareai + b7*lareaj + 
b8*adjdist + b9new*adjlij + b10*adjworki + b11*adjworkj + b12*adjareai + b13*adjareaj;

genr ftrdsh = exp(lftrdsh);

smpl 1 26082;
trend(period=161) country;
? 162 countries each with 161 trading partners
smplif country=161;
genr geog10 = (ftrdsh + ftrdsh(-1) + ftrdsh(-2) + 
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

? adding 0.001 to the eleventh element: adjworki

smpl 1 26082;
b10new = b10 + 0.001;

genr lftrdsh = b0 + b1*ldist + b2*adj + b3*lockij + 
b4*lworki + b5*lworkj + b6*lareai + b7*lareaj + 
b8*adjdist + b9*adjlij + b10new*adjworki + b11*adjworkj + b12*adjareai + b13*adjareaj;

genr ftrdsh = exp(lftrdsh);

smpl 1 26082;
trend(period=161) country;
? 162 countries each with 161 trading partners
smplif country=161;
genr geog11 = (ftrdsh + ftrdsh(-1) + ftrdsh(-2) + 
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

? adding 0.001 to the twelfth element: adjworkj

smpl 1 26082;
b11new = b11 + 0.001;

genr lftrdsh = b0 + b1*ldist + b2*adj + b3*lockij + 
b4*lworki + b5*lworkj + b6*lareai + b7*lareaj + 
b8*adjdist + b9*adjlij + b10*adjworki + b11new*adjworkj + b12*adjareai + b13*adjareaj;

genr ftrdsh = exp(lftrdsh);

smpl 1 26082;
trend(period=161) country;
? 162 countries each with 161 trading partners
smplif country=161;
genr geog12 = (ftrdsh + ftrdsh(-1) + ftrdsh(-2) + 
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

? adding 0.001 to the thirteenth element: adjareai

smpl 1 26082;
b12new = b12 + 0.001;

genr lftrdsh = b0 + b1*ldist + b2*adj + b3*lockij + 
b4*lworki + b5*lworkj + b6*lareai + b7*lareaj + 
b8*adjdist + b9*adjlij + b10*adjworki + b11*adjworkj + b12new*adjareai + b13*adjareaj;

genr ftrdsh = exp(lftrdsh);

smpl 1 26082;
trend(period=161) country;
? 162 countries each with 161 trading partners
smplif country=161;
genr geog13 = (ftrdsh + ftrdsh(-1) + ftrdsh(-2) + 
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

? adding 0.001 to the fourteenth element: adjareaj

smpl 1 26082;
b13new = b13 + 0.001;

genr lftrdsh = b0 + b1*ldist + b2*adj + b3*lockij + 
b4*lworki + b5*lworkj + b6*lareai + b7*lareaj + 
b8*adjdist + b9*adjlij + b10*adjworki + b11*adjworkj + b12*adjareai + b13new*adjareaj;

genr ftrdsh = exp(lftrdsh);

smpl 1 26082;
trend(period=161) country;
? 162 countries each with 161 trading partners
smplif country=161;
genr geog14 = (ftrdsh + ftrdsh(-1) + ftrdsh(-2) + 
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

print codesj geogt geog1 geog2;
print geog3 geog4 geog5 geog6;
print geog7 geog8 geog9 geog10;
print geog11 geog12 geog13 geog14;

