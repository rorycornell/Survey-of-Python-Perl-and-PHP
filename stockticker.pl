
#!/usr/bin/perl
# mySorter.pl
# Robert Cornell
# A Perl program that reads in a Stock Symbol and accesses nasdaq.com to get the last trade price.

use warnings;
use Getopt::Long;
use Mojo::UserAgent;
use autodie;


my $result = GetOptions(
  'help' => \$help,

);

unless ($help){
  print "Please enter the Stock Symbol\n";
  my $stock = <STDIN>;
  chomp $stock;
  my $ua = Mojo::UserAgent->new;
  my $tx = $ua->get("http://www.nasdaq.com/symbol/".$stock);
  my $getstockprice = $tx->res->dom->at('div#qwidget_lastsale')->text;
  print "The last trade price is ".$getstockprice."\n";
  exit;
  };



if ($help){
  print "Usage: perl $0 stock symbol\n";

  exit;
}
