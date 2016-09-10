#!/usr/bin/perl
# mySorter.pl
# Robert Cornell
# A Perl program that reads in an arbitrary number of strings from the command line and displays them sorted alphabetically.

use warnings;
use Getopt::Long;

my ($help, $reverse, $sort);
my $result = GetOptions(
  'sort' => \$sort,
  'reverse' => \$reverse,
  'help' => \$help,
);

unless ($reverse or $help){
  my @strings = @ARGV;
  my @sorted_strings = sort @strings;
  print "@sorted_strings\n";
  exit;
}

if ($reverse) {
  my @strings = @ARGV;
  my @sorted_strings = reverse sort @strings;
  print "@sorted_strings\n";
}

if ($help){
  print "Usage: perl $0 -s or perl $0 --sort to alphabetically sort strings from command line\n";
  print "Usage: perl $0 -r or perl $0 --reverse to reverse alphabetically sort strings from command line.\n";
  exit;
}
