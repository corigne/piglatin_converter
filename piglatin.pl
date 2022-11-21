#!/usr/bin/perl
use strict;
use warnings;

our $s_userin;

do
{
  # Prompt user.
  print("\nSentence to convert to pig latin? \n('quit' to exit): ");
  chomp($s_userin = <STDIN>);

  our @tokens = split(/[ \t]/, $s_userin);
  our @originals = @tokens;

  if($s_userin ne "quit")
  {
    print( "In piglatin: ");
    
    foreach my $word (@tokens)
    {
      $word =~ s/(.*?)([aeiou]|[AEIOU])([^,;!\?\.]*)([,;!\?\.]*?)/$2$3$1ay$4/;
    }
    
    # case preservation, check by char for each word in the original and recase
    for my $i(0 .. $#originals)
    {
      
      my @token = split(//, $tokens[$i]);
      my @original = split(//, $originals[$i]);
      
      for my $j(0 .. $#original)
      {
        if($original[$j] =~ /[[:upper:]]/)
        {
          $token[$j] = uc($token[$j]);
        }else
        {
          $token[$j] = lc($token[$j]);
        }
      }
      $tokens[$i] = join('', @token);
    }
    
    foreach my $word(@tokens)
    {
      print("$word ");
    }
    
    print ("\n");
  }

}until($s_userin eq "quit");

print("Goodbye!\n\n");