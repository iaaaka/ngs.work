#!/usr/bin/perl

use strict;

while(my $l = <STDIN>){
	my @l = split("\t",$l);
	next if ($l[2] ne 'intron');
	my ($s,$e) = ('don','acc');
	($e,$s) = ('don','acc') if($l[6] eq '-');
	print("$l[0]\t$l[1]\t$s\t".($l[3]-1)."\t$l[3]\t$l[5]\t$l[6]\t$l[7]\t$ARGV[0].$l[0].$s.$l[3]$l[6]\n");
	print("$l[0]\t$l[1]\t$e\t$l[4]\t".($l[4]+1)."\t$l[5]\t$l[6]\t$l[7]\t$ARGV[0].$l[0].$e.$l[4]$l[6]\n");
}
