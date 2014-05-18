#!/usr/bin/perl -w
use strict;
use lib '../../';
# use Debug::ShowStuff ':all';
use Class::PublicPrivate;
use Test;

# plan tests
BEGIN { plan tests => 4 };


###############################################################################
# ExtendedClass
#
package ExtendedClass;
use strict;
use base 'Class::PublicPrivate';

#------------------------------------------------------------------------------
# new
#
sub new {
	my $class = shift;
	my $self = $class->SUPER::new();
	return $self;
}
#
# new
#------------------------------------------------------------------------------


#
# ExtendedClass
###############################################################################


###############################################################################
# main
#
package main;
use strict;

# variables
my ($ob, $private);

# create PublicPrivate object
$ob = ExtendedClass->new();
ok ($ob ? 1 : 0);

# get private hash
$private = $ob->private;
ok ($private ? 1 : 0);

# store something in private hash
$private->{'a'} = 1;

# should have valuie in private
if ($ob->private->{'a'} == 1)
	{ ok 1 }
else
	{ ok 0 }

# store something in object
$ob->{'b'} = 2;

# $ob should have exactly one key
if (keys(%$ob) == 1)
	{ ok 1 }
else
	{ ok 0 }

#
# main
###############################################################################


# success
# print "\nall tests successful\n";
