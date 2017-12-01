# see senkrecht.pl for automatization of drawing the threedim simplex

# I am now working on a new, better project called "right"
# for the difference, compare the diagrams in Schmierbuch, pp. 1502 and pp. 1505

# THE OFFICIAL FILE IS NOW crj.sh WHICH BUILDS crj.asy USING crj.pl
# This perl file will generate the contour points for information theory
# for a diagram see Schmierbuch 1502

$its=10;
$sot=2**(.5);
sub twothree
{
    $y1=@_[0];
    $y2=@_[1];
$aa=$y1/$sot;
$zz=$sot*((($aa**2)-$aa+1)**.5);
$bb=$y2/$zz;
@ttr=((1-$aa)*(1-$bb),$aa*(1-$bb),$bb);
    return @ttr;
}

# for points F1 to F8 see effs.m
$a1=0.82496;
$a2=0.20412;

@effsx=(
"0.82496",
"0.82496",
"0.11785",
"1.29636",
"0.62083",
"1.12382",
"0.37667",
"1.02908"
    );

@effsy=(
"1.02062",
"0.00000",
"0.20412",
"0.20412",
"0.00000",
"0.50298",
"0.65241",
"0.00000"
    );

for ($i6=0;$i6<=$#effsy;++$i6)
{
    $df[$i6]=((($effsx[$i6]-$a1)**2)+(($effsy[$i6]-$a2)**2))**.5;
}
$mt=.5;
$ms=.1;

$nod=15;
$dd=.06;
    $dist[0]=$dd;

for ($i5=1;$i5<$nod;++$i5)
{
    $dist[$i5]=$dd+($i5*$dd);
}

open(jeff,">./crj2.asy");
# point A is (1/3,1/2,1/6) see octave functions threetwo and twothree for dimension conversions
$aa1=1/3;
$aa2=1/2;
$aa3=1/6;

my @m;
my @td;
for ($i1=0;$i1<=$#dist;++$i1)
{
for ($i2=0;$i2<=7;++$i2)
{
    undef(@td);
    undef(@m);
    $u=1/2;

for ($i4=0;$i4<$its;++$i4)
{
    $m[0]=((1-$u)*$a1)+($u*$effsx[$i2]);
    $m[1]=((1-$u)*$a2)+($u*$effsy[$i2]);
    @td=twothree($m[0],$m[1]);
    $dkl=($aa1*(log($aa1/$td[0])))+($aa2*(log($aa2/$td[1])))+($aa3*(log($aa3/$td[2])));
if ($dkl<$dist[$i1])
{
    $t1=$i4+2;
    $u=$u+(1/(2**$t1));
}
else 
{
    $t1=$i4+2;
    $u=$u-(1/(2**$t1));
}
}
$solx[$i1][$i2]=((1-$u)*$a1)+($u*$effsx[$i2]);
$soly[$i1][$i2]=((1-$u)*$a2)+($u*$effsy[$i2]);
print jeff "pair xx$i1$i2=x0000+($solx[$i1][$i2]*m*scl,$soly[$i1][$i2]*m*scl);\n";
}
for ($i7=0;$i7<=$#effsy;++$i7)
{
    # $t2[$i7]=0.75+(((($i1*$ms)+1)/$df[$i7])*$mt);
    $t2[$i7]=1;
}
print jeff "path xxx$i1=(xx${i1}0..tension $t2[0] ..xx${i1}5..tension $t2[5] ..xx${i1}3..tension $t2[3] ..xx${i1}7..tension $t2[7] ..xx${i1}1..tension $t2[1] ..xx${i1}4..tension $t2[4] ..xx${i1}2..tension $t2[2] ..xx${i1}6..tension $t2[6] ..cycle);\n";
# print jeff "path xxx$i1=(xx${i1}0..tension $t2[0] ..xx${i1}5..tension $t2[5] ..xx${i1}3..tension $t2[3] ..xx${i1}7..tension $t2[7] ..xx${i1}1..tension $t2[1] ..xx${i1}4..tension $t2[4] ..xx${i1}2..tension $t2[2] ..xx${i1}6..tension $t2[6] ..cycle);\n";
print jeff "draw (xxx$i1,norlin);\n";
}
