#!/usr/bin/perl
# Author: Nathan Jodoin
# EUID njj0057
# Lab 7 - Pig Latin Converter
#modules
use strict;
use warnings;

#script start
our $s_userin;
#do until userin eq quit
do
{
  # Prompt user.
  print("\nSentence to convert to pig latin? \n('quit' to exit): ");
  # Get user input.
  chomp($s_userin = <STDIN>);
  # Set up tokenized arr.
  our @tokens = split(/[ \t]/, $s_userin);
  our @originals = @tokens;

  #iterate through 
  if($s_userin ne "quit")
  {
    print( "In piglatin: ");
    
    foreach my $word (@tokens)
    {
      $word =~ s/(.*?)([aeiou]|[AEIOU])([^,;!\?\.]*)([,;!\?\.]*?)/$2$3$1ay$4/;
    }
    
    # case preservation, check by char for each word in the original and recase
    # if necessary, tested and working...
    for my $i(0 .. $#originals)
    {
      my @token = split(//, $tokens[$i]);
      my @original = split(//, $originals[$i]);
      
      for my $j(0 .. $#original)
      {

        if($original[$j] =~ /[[:upper:]]/){
        
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
#Exit statement.
print("Goodbye!\n\n");

