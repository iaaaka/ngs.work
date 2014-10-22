#!/usr/bin/perl
use strict;

#hs pt rm

# hash of arrays by id. each array contains [list of species, site type,coor in hs,coor in pt,coor in rm]
my %h;

for(my $f=0;$f<@ARGV;$f++){
	open IN,$ARGV[$f] or die "cannot open file $ARGV[$f]: $!\n";
	while(my $l = <IN>){
		chomp $l;
		my @l = split("\t",$l);
		next if($l[3] + 1 != $l[4]);
		$h{$l[8]}[0] .= $f;
		$h{$l[8]}[1]  = $l[2];
		$h{$l[8]}[$f+2] = "$l[0]:$l[6]:$l[3]";

	}
	close IN;
}

print("id\ttype\ths\tpt\trm\n");
for my $k (keys %h){
	print(join("\t",$k,$h{$k}[1],@{$h{$k}}[2..4]),"\n") if ($h{$k}[0] eq '012');
}
