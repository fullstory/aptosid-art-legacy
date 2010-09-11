#!/usr/bin/perl

my ($frames) = 30;
my (@effects);

foreach (@ARGV)
{
	if (s/^effect\=//i)
	{
		if (s/^opacity//i)
		{
			$n='opacity';
			if (s/^\://)
			{
				if ((/^in$/i)||(/^out$/i)||(/^cycle$/i))
				{
					$t=$_;
				}
				else
				{
					die "Unrecognised type of effect ($_) for $n";
				}
			}
		}
		else
		{
			die "Effect $_ not implemented";
		}
		push(@effects,{ 'name' => "$n", 'type' => "$t" })
	}
	elsif (s/^frames\=//)
	{
		$frames=$_;
	}
}

if (@effects == 0)
{
	print STDERR "no effect given on command line";
	die "Usage example: $0 frames=30 effect=opacity:cycle < some.svg";
}

my (%attr);
my ($ht, $wt);

sub handle_start
{
	my ($p) = shift;
	my ($e) = shift;
	if ($e=~/^svg$/i)
	{
		while (@_)
		{
			my ($a) = shift();
			my ($v) = shift();
			$attr{$a}=$v;
			if ($a=~/^height$/i)
			{
				$v=~s/^\d+//;
				$ht=$v;
			}
			elsif ($a=~/^width$/i)
			{
				$v=~s/^\d+//;
				$wt=$v;
			}
		}
	}
}

while(read(STDIN,$buf,4096))
{
	$svg.=$buf;
}

use XML::Parser;
$p = new XML::Parser(
	Handlers => 
	{
		Start => \&handle_start,
	}
);

$p->parse($svg);

unless ($attr{'width'}*$attr{'height'})
{
	die "failed to parse the height and width";
}

my ($head) = $svg;
$head =~ s/\<svg.*//mis;

my ($tail) = $svg;
$tail =~ s/.*\<\/svg\>//mis;

my ($content) = $svg;
$content =~ s/.+?\<svg.+?\>(.*)\<\/svg\>.*/$1/mis;

print $head;

print '<svg height="'.int(1+($frames-1)/10)*$attr{'height'}."$ht".'" width="';
if ($frames>=10)
{
	$w=10;
}
else
{
	$w=$frames;
}
print $w*$attr{'width'}."$wt";
print '" viewBox="';
my (@vb) = split(/\s+/,$attr{'viewBox'});
$vb[2]=$w*$attr{'width'};
$vb[3]=int(1+($frames-1)/10)*$attr{'height'};
print join(' ',@vb).'"';
foreach $k (keys(%attr))
{
	if (($k!~/^width$/i)&&($k!~/^height$/i)&&($k!~/^viewBox$/i))
	{
		print " $k=\"".$attr{$k}."\"";
	}
}
print '>';
print "\n";

for $f (1..$frames)
{
	my ($g) = '<g transform="translate('.$attr{'width'}*(($f-1)%10).','.$attr{'height'}*int(($f-1)/10).')"';
	foreach (@effects)
	{
		if ($$_{'type'}=~/^in$/i)
		{
			$v=sprintf("%.6f",$f/$frames);
		}
		elsif ($$_{'type'}=~/^out$/i)
		{
			$v=sprintf("%.6f",(1-$f/$frames));
		}
		elsif ($$_{'type'}=~/^cycle$/i)
		{
			$h=$frames/2;
			if ($f<=$h)
			{
				$v=sprintf("%.6f",$f/($frames/2));
			}
			else
			{
				$v=sprintf("%.6f",(1-($f-$h)/$h));
			}
		}
		$g.=' '.$$_{'name'}.'="'.$v.'"';
	}
	$g.="\>$content";
	$g.='</g>';
	print "$g\n";
}
print '</svg>';
print $tail;
