#!/usr/bin/perl -w
use warnings;
use strict;
my $count=0;
my @matrice= ();
$|=1;
my $count_carica=0;
my @table;
my $quadrati;
my $sdrena=1;
my $t;

if ($#ARGV <2) 
	{die "perl spirale.pl SideDimension X_cord Y_codd";}

system("clear");

my $lati=$ARGV[0]-1;
#print "I lati sono $lati\n";
my $da_visualizzare=$lati*$lati;
#print "I quadrati sono $da_visualizzare\n";
my $cord_x=$ARGV[1]-1;
my $cord_y=$ARGV[2]-1;

# inizializzo l'area a zero come se dovesse essere tutta caricata tarapio
for (my $y=0; $y<=$lati; $y++)
{
    for(my $x=0; $x<=$lati; $x++)
    {
	$matrice[$y][$x]=0;
    }
}
#bello usare x e y a cazzo di cane.


# ovviamente per te sarà solamente una funzione tipo "carica tiles"
sub showspi 
{
    for (my $y=0; $y<=$lati; $y++)
    {
	# y 
	for (my $x=0; $x<=$lati; $x++)
	{
	    if (exists $matrice[$x][$y] && $matrice[$x][$y]==1)
	    { 
		print "X";
	    }
	    else 
	    {
		print " ";
	    }
	}
	print "|\n";
    }   
    sleep(1);
    system("clear");
}


# +x,+y,-x,-y
# che deficiente, non devo solo disegnare gli angoli ma anche quello che ci sta in mezzo diocane!
sub creaspirale
{
	$matrice[$cord_x][$cord_y]=1;
	showspi();
	#	# finchè il numero che conta ogni quadrato riempito
    #{                # è pari al numero di quadrati che sono nello schermo. (o no?)
	for ($t=1; $t<=5; $t++)
	{
	    my $k;
	    if ($t==1)
	    {	
		# mi sposto a destra
		for ($k=$cord_x; $k<=$cord_x+$sdrena; $k++)
		{
		    #print"1\n";
		    #print "k $k\n";
		    #print "cordx $cord_x\n";
		    #print "cordy $cord_y\n";
		    #print "sdrena $sdrena\n";
		    $matrice[$k][$cord_y]=1;
		    showspi();
		}
		$cord_x=$cord_x+$sdrena;
			#$sdrena++;
	    }
	    if ($t==2)
	    {
		# mi sposto in alto
		for ($k=$cord_y; $k>=$cord_y-$sdrena; $k--)
		{
		    #print "2\n";
		    #print "k $k\n";
		    #print "cordx $cord_x\n";
		    #print "cordy $cord_y\n";
		    #print "sdrena $sdrena\n";
		    $matrice[$cord_x][$k]=1;
		    showspi();
		}
		$cord_y=$cord_y-$sdrena;
		$sdrena++;
	    }
	    if ($t==3)
	    {
		# mi sposto a sinistra
		for ($k=$cord_x	;$k>=$cord_x-$sdrena;$k--)
		{
		    #print "3\n";
		    #print "k $k\n";
		    #print "cordx $cord_x\n";
		    #print "cordy $cord_y\n";
		    #print "sdrena $sdrena\n";
		    $matrice[$k][$cord_y]=1;
		    showspi();
		}	
		$cord_x=$cord_x-$sdrena;    
	    }
	    if ($t==4)
	    {
			# mi sposto in basso
			for ($k=$cord_y;$k<=$cord_y+$sdrena;$k++)
			{
				#print "4\n";
				#print "k $k\n";
				#print "cordx $cord_x\n";
				#print "cordy $cord_y\n";
				#print "sdrena $sdrena\n";
				$matrice[$cord_x][$k]=1;
				showspi();
			}
			$cord_y=$cord_y+$sdrena;
			$sdrena++;
		}
	}
}

while ($count<=$da_visualizzare)
{
    creaspirale();
}
