#!/usr/bin/perl
use strict;
use Data::Dumper;

sub Fill {
  my $str = shift;
  my $length = shift;

  if ($length ne 0) {
    my $l=length($str);
    if ( $l >= $length ) {
      $str=substr($str,0,$length);
    }
    else {
      my $s=$length-$l;
      my $i;
      for ($i='1'; $i <= $s; $i++) {
        $str=$str." ";
      }
    }
  }

  return $str;
}

my @lines;
my $n;
my $m;
my $d;
my $f;
my $l;
my $b;
while (<>) {
  if (m/^(.*?)\s+(\(\S+\))*\s+([\-X])\s+([\-X)])\s+([\-X)])\s+([\-X)])/) {
    $n = $1;
    $m = $2;
    $d = $3;
    $f = $4;
    $l = $5;
    $b = $6;
    $n =~ s/_/\\_/g;
    $m = " " unless ($m);
    $d =~ s/X/\$\\times\$/g;
    $f =~ s/X/\$\\times\$/g;
    $l =~ s/X/\$\\times\$/g;
    $b =~ s/X/\$\\times\$/g;

    $d =~ s/-/---/g;
    $f =~ s/-/---/g;
    $l =~ s/-/---/g;
    $b =~ s/-/---/g;

    push (@lines,{'n'=>$n,'m'=>$m,'d'=>$d,'f'=>$f,'l'=>$l,'b'=>$b});
  }
}

my $line;
my $nl=0;
my $ml=0;
my $dl=0;
my $fl=0;
my $ll=0;
my $bl=0;
foreach $line (@lines) {
  $nl=length($line->{'n'}) if (length($line->{'n'}) > $nl);
  $ml=length($line->{'m'}) if (length($line->{'m'}) > $ml);
  $dl=length($line->{'d'}) if (length($line->{'d'}) > $dl);
  $fl=length($line->{'f'}) if (length($line->{'f'}) > $fl);
  $ll=length($line->{'l'}) if (length($line->{'l'}) > $ll);
  $bl=length($line->{'b'}) if (length($line->{'b'}) > $bl);
}

foreach $line (@lines) {
  printf("%s & %s & %s & %s & %s & %s \\\\\n\\hline\n",Fill($line->{'n'},$nl),Fill($line->{'m'},$ml),Fill($line->{'d'},$dl),Fill($line->{'f'},$fl),Fill($line->{'l'},$ll),Fill($line->{'b'},$bl));
}
