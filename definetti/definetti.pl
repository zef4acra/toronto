# I have now abandoned this project in perl and am writing it in julia instead --> much more efficient!
# see definetti.jl

use Statistics::R;

# Create a communication bridge with R and start R
$R = Statistics::R->new();
 
# Run simple R commands
# my $output_file = "file.ps";
# $R->run(qq`postscript("$output_file", horizontal=FALSE, width=500, height=500)`);
# $R->run(q`plot(c(1, 5, 10), type = "l")`);
# $R->run(q`dev.off()`);
 
# Pass and retrieve data (scalars or arrays)
# my $input_value = 2;
# $R->set('x', $input_value);
# $R->run(q`y <- x^2`);
# my $output_value = $R->get('y');
# print "y = $output_value\n";
# $R->stop();

$n=1;
$mu=1;
$sd=.5;

# open(definetti,">./definetti.htm");

# print definetti "<html><head><title>Bruno de Finetti's Theorem Valid for Kullback-Leibler?</title></head><body><h1>Bruno de Finetti's Theorem Valid for Kullback-Leibler?</h1><p><table border=\"5\"><tr><td></td>";

for ($i1=0;$i1<$n;++$i1)
{
    for ($i2=0;$i2<=0;++$i2)
{
    # $x=-1;
    # while ($x<0)
    # {
$R->set('mu', $mu);
$R->set('sd', $sd);
$R->run(q`x <- rnorm(8,mu,sd)`);
$x=$R->get('x');
    # }
# for ($i3=0;$i3<=7;++$i3)
# {
#     $e[$i3]=$x[$i3];
#     print "The credence for E$i3 is $e[$i3]\n";
# }
$t1=join(",",@$x);
print "$t1\n";
}
}

$R->stop();
print definetti "</table></body></html>";
close(definetti);
