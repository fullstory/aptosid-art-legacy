#!/usr/bin/perl

use strict;
use Getopt::Std;
use Image::Magick;

#get parameters
my %options;
getopts("o:h",\%options);
if (defined $options{h}) {
	print "useage: perl composite_pngs.pl -o output_file_name input_1 input_2 input_3 ... input_n\n";
	exit;
}
die "output file name required, use -o 'out_name.png'" unless (defined $options{o});
die "need at least 2 images to composite.  append file names at end of options list." unless (@ARGV > 1);

#read input images
my @inputs;
my $width = 0;
my $height = 0;
foreach (@ARGV) {
	my $img = Image::Magick->new;
	my $err = $img->Read("png:" . $_);
	die "$err" if "$err";
	my $w = $img->Get('columns');
	$width = $w > $width ? $w : $width;
	my $h = $img->Get('rows');
	$height = $h > $height ? $h : $height;
	push(@inputs, $img);
}

#create output
my $output = Image::Magick->new(size=>$width . 'x' . $height);
$output->Read('xc:transparent');

#composite inputs
my $input;
foreach $input (@inputs) {
	$output->Composite(image=>$input, compose=>'over');
}

#save output
print "writing: " . $options{o} . "\n";
$output->Write('png:' . $options{o});
