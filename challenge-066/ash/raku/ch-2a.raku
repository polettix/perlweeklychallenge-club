#!/usr/bin/env raku

my $n = 81;
# my $n = 45;

for [X] (1..$n.sqrt) xx 2 -> ($x, $y) {
    say "$x^$y" and exit if $n == $x ** $y;
}

say 0;
