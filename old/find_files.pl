#!/usr/bin/perl
use strict;

my $p = $ARGV[0];
opendir(DIR, "$p");
my @s = readdir(DIR);
closedir(DIR);
for(my $i=0;$i<@s;$i++){
	next if($s[$i] !~ /^Sample/);
	opendir(DIR, "$p/$s[$i]");
	my @fs = readdir(DIR);
	my $o = '';
	print($s[$i],"\t");
	foreach my $f (@fs){
		print("$p/$s[$i]/$f,") if($f =~ /\.fastq\.gz/);
	}
	print("\n");
	closedir(DIR);
}

