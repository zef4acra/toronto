# use dreieck.pl if you want to test each point of the simplex for something
# I put the perl file that just draws the basic simplex in template-simplex.pl

### SUBROUTINES ###

sub threetwo
{
    $a=@_[0];
    $b=@_[1];
    $c=@_[2];

    $u2=1+(($b/($b+$c))**2+(($c/($b+$c))**2));
    $v2=((1-($b/($b+$c)))**2)+(($c/($b+$c))**2);
    $u=$u2**.5;
    $v=$v2**.5;
    $psi=1-(((($u2)+($v2)-2)/(2*($u)*($v)))**2);
    $k2=(($a-1)**2)+($b**2)+($c**2);
    $m2=.5*($v2)*($psi)*($k2);
    $l2=$k2-$m2;
    $r1=$l2**.5;
    $r2=$m2**.5;
    @res=($r1,$r2);
}

sub dkl
{
    $a1=@_[0];
    $a2=@_[1];
    $a3=@_[2];
    $b1=@_[3];
    $b2=@_[4];
    $b3=@_[5];
    $dkl=$a1*(log($a1/$b1))+$a2*(log($a2/$b2))+$a3*(log($a3/$b3));
}

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

### VARIABLES ###

$grain=99;
$its=15;
$nod=15;
$dd=.03;
$sot=2**(.5);

### WRITING THE ASY FILE ###

open(canonical,">./canonical.asy");

print canonical "size(400pt,400pt);\n";
print canonical "real m=1;\n";
print canonical "real n=1;\n";
print canonical "real fl=-2;\n";
print canonical "real fr=16;\n";
print canonical "real fu=14;\n";
print canonical "real fd=-2;\n";
print canonical "path frame=((fl*m,fu*n)--(fr*m,fu*n)--(fr*m,fd*n)--(fl*m,fd*n)--cycle);\n";
print canonical "draw(frame,linewidth(0));\n";
# for ($i1=0;$i1<=25;++$i1)
# {
# for ($i2=0;$i2<=25;++$i2)
# {
#     if ($i1<10)
#     {
# 	$f1="0";
#     }
#     else
#     {
# 	$f1="";
#     }
#     if ($i2<10)
#     {
# 	$f2="0";
#     }
#     else
#     {
# 	$f2="";
#     }
# print canonical "pair x$f1$i1$f2$i2=($i1*m,$i2*n);\n";
# }
# }
print canonical "pair x0000=(0*m,0*n);\n";
print canonical "real sot=2**.5;\n";
print canonical "real sos=6**.5;\n";
print canonical "real stt=(3/2)**.5;\n";
print canonical "real scl=10;\n";
print canonical "pair X=x0000;\n";
print canonical "pair Y=x0000+(sot*m*scl,0*m*scl);\n";
print canonical "pair Z=x0000+((sot/2)*m*scl,stt*m*scl);\n";
print canonical "pair Xf=X+(0*m*scl,-0.14*m*scl);\n";
print canonical "pair Yf=Y+(0*m*scl,-0.14*m*scl);\n";
print canonical "pair Xx=x0000-((1/sot)*m*scl*(1/7),(1/sos)*m*scl*(1/7));\n";
print canonical "pair Yy=Y+((1/sot)*m*scl*(1/7),(1/sos)*m*scl*(-1/7));\n";
print canonical "pair Zz=Z+(0*m*scl,((1/sos)*2*(1/7))*m*scl);\n";
print canonical "pair M=x0000+((sot/2)*m*scl,stt*m*scl*(1/3));\n";
$inc=1/($grain+1);
for ($c1=0;$c1<$grain;++$c1)
{
for ($c2=0;$c2<$grain;++$c2)
{
    unless ($c1+$c2+1>=$grain)
    {
	$ccx=($c1+1)*$inc;
	$ccy=($c2+1)*$inc;
	$ccz=1-($ccx+$ccy);
	print canonical "pair f${c1}f${c2}=$ccx*X+$ccy*Y+$ccz*Z;\n";
    }
}
}
print canonical "path whitef=(X--Xf--Yf--Y--cycle);\n";
print canonical "path mx=(X--M);\n";
print canonical "path my=(Y--M);\n";
print canonical "path mz=(Z--M);\n";
print canonical "path mxx=(X--Xx);\n";
print canonical "path myy=(Y--Yy);\n";
print canonical "path mzz=(Z--Zz);\n";
print canonical "path elt=(X--Y--Z--cycle);\n";
print canonical "pen norlin=linewidth(1);\n";
for ($e1=0;$e1<$grain;++$e1)
{
for ($e2=0;$e2<$grain;++$e2)
{
    unless ($e1+$e2+1>=$grain)
    {
	$ddx=(($e1+1)*$inc)*255;
	$ddy=(($e2+1)*$inc)*255;
	$ddz=255-($ddx+$ddy);
print canonical "pen p${e1}p${e2}=linewidth(3)+rgb($ddx,$ddy,$ddz);\n";
    }
}
}
print canonical "pen conorl=linewidth(1)+rgb(0,255,0);\n";
print canonical "fill(whitef,rgb(255,255,255));\n";
print canonical "draw(elt,norlin);\n";
print canonical "draw(mx,dashed);\n";
print canonical "draw(my,dashed);\n";
print canonical "draw(mz,dashed);\n";
print canonical "draw(mxx,norlin);\n";
print canonical "draw(myy,norlin);\n";
print canonical "draw(mzz,norlin);\n";
for ($d1=0;$d1<$grain;++$d1)
{
for ($d2=0;$d2<$grain;++$d2)
{
    unless ($d1+$d2+1>=$grain)
    {
	print canonical "draw(f${d1}f${d2},p${d1}p${d2});\n";
    }
}
}
print canonical "label(\"x\",Xx,SE);\n";
print canonical "label(\"y\",Yy,SW);\n";
print canonical "label(\"z\",Zz,E);\n";
# print canonical "dot(\"\$m\$\",M);\n";

close(canonical);
