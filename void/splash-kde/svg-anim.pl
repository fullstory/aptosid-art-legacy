#!/usr/bin/perl

use strict;
use Math::Trig;

my $id=200;

my ($icon) = shift(@ARGV);
die "input argument $icon is not a file" unless (-f $icon);

my ($frames) = shift(@ARGV);
die "frames argument $frames is not 2 or more" unless ($frames >=2);

my ($anim) = shift(@ARGV);
die "not enough arguments" unless (length($anim));

my (@effects);

my $arg;

foreach $arg (@ARGV)
{
	my ($n, $f, $t, $o) = split(',',$arg);
	my ($fv, $ff) = split (':',$f);
	my ($tv, $tf) = split (':',$t);
	$ff=0 if (!($ff));
	$fv=0 if (!($fv));
	$tf=$frames if (!($tf));
	$tv=1 if (!($tv));
	$effects[@effects]{'name'} = "$n";
	$effects[@effects-1]{'start'}{'value'} = $fv;
	$effects[@effects-1]{'start'}{'frame'} = $ff;
	$effects[@effects-1]{'end'}{'value'} = $tv;
	$effects[@effects-1]{'end'}{'frame'} = $tf;
	$effects[@effects-1]{'sin'}=0;
	$effects[@effects-1]{'pos'}=0;
	my (@o) = split(':',$o);
	foreach (@o)
	{
		if ($_=~/^sin$/i)
		{
			$effects[@effects-1]{'sin'}=1;
		}
		if ($_=~/^base$/i)
		{
			$effects[@effects-1]{'pos'}=1;
		}
		if ($_=~/^middle$/i)
		{
			$effects[@effects-1]{'pos'}=0.5;
		}
	}
}

if (@effects == 0)
{
	print STDERR "no effect given on command line\n";
	print STDERR "Usage: $0 input.svg frames output.svg effect,startframe:startvalue,endframe:endvalue(,sin)";
	die "Example: $0 input.svg 30 output.svg opacity";
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
				$v=~s/^[\d\.]+//;
				$ht=$v;
			}
			elsif ($a=~/^width$/i)
			{
				$v=~s/^[\d\.]+//;
				$wt=$v;
			}
		}
	}
}

my $buf;
my $svg;
open(SVG,"$icon")||die "failed to open $icon for reading";
while(read(SVG,$buf,4096))
{
	$svg.=$buf;
}
close(SVG);

use XML::Parser;
my $p = new XML::Parser(
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

open(ANIM,">$anim")||die "failed to open $anim for writing";
print ANIM $head;

print ANIM '<svg height="'.int(1+($frames-1)/10)*$attr{'height'}."$ht".'" width="';

my $w;
if ($frames>=10)
{
	$w=10;
}
else
{
	$w=$frames;
}
print ANIM $w*$attr{'width'}."$wt";
print ANIM '" viewBox="';
my (@vb) = split(/\s+/,$attr{'viewBox'});
$vb[2]=$w*$attr{'width'};
$vb[3]=int(1+($frames-1)/10)*$attr{'height'};
print ANIM join(' ',@vb).'"';

my $k;
foreach $k (keys(%attr))
{
	if (($k!~/^width$/i)&&($k!~/^height$/i)&&($k!~/^viewBox$/i))
	{
		print ANIM " $k=\"".$attr{$k}."\"";
	}
}
print ANIM '>'."\n";

my $f;
my $o;
my $defs='<defs>';
for $f (1..($frames))
{
	my $h='<g transform="translate('.$attr{'width'}*(($f-1)%10).','.$attr{'height'}*int(($f-1)/10).')">';
	my $t='</g>'."\n";
	foreach (@effects)
	{
		if ( ($f >= $$_{'start'}{'frame'}) && ($f <= $$_{'end'}{'frame'}) ) {
			my $v=0;
				my(@v)=[];
				my @ms=split('~',$$_{'start'}{'value'});
				my @mf=split('~',$$_{'end'}{'value'});
				my($mc)=0;
				my $ms;
				foreach $ms (@ms) {
					$v[$mc]=sprintf("%.6f", $ms +
						($f - $$_{'start'}{'frame'}) * (
						($mf[$mc] - $ms) /
						($$_{'end'}{'frame'} - $$_{'start'}{'frame'} ) ) ) ;
					$mc++;
				}
			if ($$_{'sin'})
			{
				if (($$_{'name'}=~/^skew/)||($$_{'name'}=~/^rotate$/))
				{
					$v = sprintf("%.6f", $$_{'start'}{'value'} + ($$_{'end'}{'value'} - $$_{'start'}{'value'}) * (sin(pi*$f/(2*$$_{'end'}{'frame'}))));
				}
				else
				{
					$mc=0;
					my $mv;
					foreach $mv (@v)
					{
						$v[$mc] = sin($mv*pi/2);
						$mc++;
					}
				}
			}
			$v=join(',',@v);
			if ($$_{'name'}=~/^saturate$/i) {
				$h.='<g filter="url(#saturate'.$id.')">';
				$t='</g>'."\n".$t;
				$defs.='<filter id="saturate'.$id.'" filterUnits="objectBoundingBox" x="0%" y="0%" width="100%" height="100%"><feColorMatrix type="saturate" values="'.$v.'" /></filter>';
				$id++;
			}
			elsif (($$_{'name'}=~/^scale.?$/i)||($$_{'name'}=~/^translate$/i)||($$_{'name'}=~/^rotate$/i)||($$_{'name'}=~/^skewx$/i)||($$_{'name'}=~/^skewy$/i)||($$_{'name'}=~/^matrix$/i)) {
				my ($name)=$$_{'name'};
				my ($rcenter)=sprintf("%.6f",($attr{'width'}/2)).','.sprintf("%.6f",($attr{'height'}/2));
				if ($name=~/^rotate$/i) {
					$v.=",$rcenter";
				}
				if ($name=~/^scale.?$/i) {
					my $sx=sprintf("%.6f",($attr{'width'}*((1-$v)/2)));
					my $sy=sprintf("%.6f",($attr{'height'}*((1-$v)/2)));
					if ($$_{'pos'}==1) {
						$sy=2*$sy;
					}
					if ($name=~/^scalex$/i) {
						$sy=0;
					}
					elsif ($name=~/^scaley$/i) {
						$sx=0;
					}
					$h.='<g transform="translate('.$sx.','.$sy.')">';
					$t='</g>'."\n".$t;		
					$name='scale';
					if ($$_{'name'}=~/^scalex$/i) {
						$h.='<g transform="'.$name.'('.$v.',1)">';
						$t='</g>'."\n".$t;
					}
					elsif ($$_{'name'}=~/^scaley$/i) {
						$h.='<g transform="'.$name.'(1,'.$v.')">';
						$t='</g>'."\n".$t;
					}
					else {
						$h.='<g transform="'.$name.'('.$v.')">';
						$t='</g>'."\n".$t;
					}
				}
				elsif ($name=~/^skewx$/i) {
					$h.='<g transform="rotate(180,'.$rcenter.')"><g transform="'.$name.'('.$v.')"><g transform="rotate(180,'.$rcenter.')">';
					$t='</g></g></g>'."\n".$t;
				}
				else
				{
					$h.='<g transform="'.$name.'('.$v.')">';
					$t='</g>'."\n".$t;
				}
			}
			else
			{
				$h.='<g '.$$_{'name'}.'="'.$v.'">';
				$t='</g>'."\n".$t;
			}
		}
	}
	$o.=$h.$content.$t;
}
print ANIM $defs.'</defs>'."\n";
print ANIM $o;
print ANIM '</svg>'."\n";
print ANIM $tail;
close(ANIM);
