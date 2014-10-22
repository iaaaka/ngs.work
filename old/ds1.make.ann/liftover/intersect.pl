#!/usr/bin/perl

use strict;

my %h;

for(my $f=0;$f<@ARGV;$f++){
	open IN,$ARGV[$f] or die "cannot open file $ARGV[$f]: $!\n";
	while(my $l = <IN>){
		$h{$l} .= $f;
	}
	close IN;
}

my $r = join '',0..(@ARGV-1);

for my $k (keys %h){
	print $k if($h{$k} eq $r);
}

