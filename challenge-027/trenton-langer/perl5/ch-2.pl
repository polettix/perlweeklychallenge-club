#!/mu/bin/perl -w
use strict;
no warnings;



##################################################################################################################################################################
##################################################################################################################################################################
## Authorship
##################################################################################################################################################################
##################################################################################################################################################################
### Project
############# Perl Weekly Challenge - 027
### Name
############# c027_t2.pl
### Author
############# Trenton Langer
### Creation Date
############# 20190922
### Description
############# Display of historical data



#####################################################################################################################
#####################################################################################################################
## PWC - 027 - Task 2
#####################################################################################################################
#####################################################################################################################
#Write a script that allows you to capture/display historical data. 
#
#It could be an object or a scalar. For example
#    my $x = 10; $x = 20; $x -= 5;
#
#After the above operations, it should list $x historical value in order.



#####################################################################################################################
#####################################################################################################################
## Solution
#####################################################################################################################
#####################################################################################################################
tie my $x, 'HistoricalScalar';
$x = 10;
$x = 20;
$x -= 5;
untie $x;



#####################################################################################################################
#####################################################################################################################
## Subs
#####################################################################################################################
#####################################################################################################################
package HistoricalScalar;
sub TIESCALAR # obj creation (tie $scalar, 'NAME', args)
{
    my $class = shift;

    my $self;
    $self->{_ARRAY} = [];
        
    return bless $self, $class;
}
sub FETCH # retrieve values
{
    my $self = shift;
    return $self->{_ARRAY}->[-1];
}
sub STORE # stores values
{
    my $self = shift;
    my $input = shift;     
    push @{$self->{_ARRAY}}, $input;
}
sub UNTIE # indicate no longer need tied variable (untie $@%var;)
{
    my $self = shift;
    print "History:\n";
    foreach my $val (@{$self->{_ARRAY}})
    {
        print "\t->\t$val\n";
    }
}
sub DESTROY # clean up (undef $@%var;)
{
    my $self = shift;
}


