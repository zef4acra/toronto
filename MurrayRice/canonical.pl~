# use dreieck.pl if you want to test each point of the simplex for something
# I put the perl file that just draws the basic simplex in template-simplex.pl

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

$its=15;
$nod=15;
$dd=.03;
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

open(senkrecht,">./senkrecht.asy");

print senkrecht "size(400pt,400pt);\n";
print senkrecht "real m=1;\n";
print senkrecht "real n=1;\n";
print senkrecht "real fl=-2;\n";
print senkrecht "real fr=16;\n";
print senkrecht "real fu=14;\n";
print senkrecht "real fd=-2;\n";
print senkrecht "path frame=((fl*m,fu*n)--(fr*m,fu*n)--(fr*m,fd*n)--(fl*m,fd*n)--cycle);\n";
print senkrecht "draw(frame,linewidth(0));\n";
for ($i1=0;$i1<=25;++$i1)
{
for ($i2=0;$i2<=25;++$i2)
{
    if ($i1<10)
    {
	$f1="0";
    }
    else
    {
	$f1="";
    }
    if ($i2<10)
    {
	$f2="0";
    }
    else
    {
	$f2="";
    }
print senkrecht "pair x$f1$i1$f2$i2=($i1*m,$i2*n);\n";
}
}
print senkrecht "real sot=2**.5;\n";
print senkrecht "real sos=6**.5;\n";
print senkrecht "real stt=(3/2)**.5;\n";
print senkrecht "real scl=10;\n";
print senkrecht "pair X=x0000;\n";
print senkrecht "pair Y=x0000+(sot*m*scl,0*m*scl);\n";
print senkrecht "pair Z=x0000+((sot/2)*m*scl,stt*m*scl);\n";
print senkrecht "pair Xf=X+(0*m*scl,-0.14*m*scl);\n";
print senkrecht "pair Yf=Y+(0*m*scl,-0.14*m*scl);\n";
print senkrecht "path whitef=(X--Xf--Yf--Y--cycle);\n";
print senkrecht "pair Xx=x0000-((1/sot)*m*scl*(1/7),(1/sos)*m*scl*(1/7));\n";
print senkrecht "pair Yy=Y+((1/sot)*m*scl*(1/7),(1/sos)*m*scl*(-1/7));\n";
print senkrecht "pair Zz=Z+(0*m*scl,((1/sos)*2*(1/7))*m*scl);\n";
print senkrecht "pair M=x0000+((sot/2)*m*scl,stt*m*scl*(1/3));\n";
print senkrecht "path mx=(X--M);\n";
print senkrecht "path my=(Y--M);\n";
print senkrecht "path mz=(Z--M);\n";
print senkrecht "path mxx=(X--Xx);\n";
print senkrecht "path myy=(Y--Yy);\n";
print senkrecht "path mzz=(Z--Zz);\n";
print senkrecht "path elt=(X--Y--Z--cycle);\n";
print senkrecht "pen norlin=linewidth(1);\n";
print senkrecht "pen conorl=linewidth(1)+rgb(0,255,0);\n";
print senkrecht "fill(whitef,rgb(255,255,255));\n";
print senkrecht "draw(elt,norlin);\n";
print senkrecht "draw(mx,dashed);\n";
print senkrecht "draw(my,dashed);\n";
print senkrecht "draw(mz,dashed);\n";
print senkrecht "draw(mxx,norlin);\n";
print senkrecht "draw(myy,norlin);\n";
print senkrecht "draw(mzz,norlin);\n";
print senkrecht "label(\"x\",Xx,SE);\n";
print senkrecht "label(\"y\",Yy,SW);\n";
print senkrecht "label(\"z\",Zz,E);\n";
print senkrecht "dot(\"\$m\$\",M);\n";

close(senkrecht);
