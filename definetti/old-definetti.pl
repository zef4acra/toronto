# This is all garbage. You are doing this for whether a token is green, yellow, or red, one of which it must be. The credence (1,1,1) will always do better than a probability distribution on Kullback-Leibler because if the truth is x(i) (red for i=1 etc.) then delta=-log(p(i))-(-log(c(i)))=-log(p(i))<0 BECAUSE p is a probability distribution! p does badly because it is disciplined!

# Here is what you need to change: let there be three events E1, E2, E3. Consider credence functions: all over the place with respect to the algebra. Then consider probability functions: they only need to be defined on E1, E2, and E3. Now the following should be true (dF-KL) for all credences, there is at least one probability function such that DKL(w(i),p)=<DKL(w(i),c) for all i, where i ranges over the possible truth combinations of E1, E2, and E3.

$z=5;
$from=0;
$to=2;
$y=$to*$z;
$x=$y**3;
$count=1;

open(definetti,">./definetti.htm");

print definetti "<html><head><title>Bruno de Finetti's Theorem Valid for Kullback-Leibler?</title></head><body><h1>Bruno de Finetti's Theorem Valid for Kullback-Leibler?</h1><p><table border=\"5\"><tr><td></td>";

for ($i1=1;$i1<$z;++$i1)
{
    $s1=$z-$i1;
for ($i2=1;$i2<$s1;++$i2)
{
    $s2=$z-$i1-$i2;
    @p=($i1*(1/$z),$i2*(1/$z),1-($i1*(1/$z)+$i2*(1/$z)));
    for ($l1=0;$l1<=$#p;++$l1)
{
    $ps[$l1]=sprintf("%.1f",$p[$l1]);
}
    print definetti "<td>$ps[0]:$ps[1]:$ps[2]</td>";
}
}
    print definetti "</tr>";
for ($j1=1;$j1<$y;++$j1)
{
for ($j2=1;$j2<$y;++$j2)
{
for ($j3=1;$j3<$y;++$j3)
{
    @c=($from+$j1*($to/$y),$from+$j2*($to/$y),$from+$j3*($to/$y));
    # print "$c[0],$c[1],$c[2]\n";
    for ($l2=0;$l2<=$#c;++$l2)
{
    $cs[$l2]=sprintf("%.1f",$c[$l2]);
}
    print definetti "<tr><td>$cs[0]:$cs[1]:$cs[2]</td>";
for ($i1=1;$i1<$z;++$i1)
{
    $s1=$z-$i1;
for ($i2=1;$i2<$s1;++$i2)
{
    $s2=$z-$i1-$i2;
    @p=($i1*(1/$z),$i2*(1/$z),1-($i1*(1/$z)+$i2*(1/$z)));
    # print "$p[0],$p[1],$p[2]\n";
for ($k=0;$k<=2;++$k)
{
    $delta[$k]=log($p[$k])-log($c[$k]);
}
@dsorted=sort(@delta);
$record=sprintf("%.4f",$dsorted[0]);
if ($record<0)
{
    $fc="red";
}
else
{
    $fc="green";
}
print definetti "<td><font color=\"$fc\">$record</font></td>";
}
}
print definetti "</tr>";
# print "$count of $x\n";
$count=$count+1;
}
}
}

print definetti "</table></body></html>";
close(definetti);
