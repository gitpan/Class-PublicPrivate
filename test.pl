#!/usr/local/bin/perl -w
use strict;
# use lib '../../';
use Class::PublicPrivate;
use Test;

BEGIN { plan tests => 2 };


###########################################################
# Class::PublicPrivate::ExtendedClass
#
package Class::PublicPrivate::ExtendedClass;
use vars '@ISA';
@ISA=('Class::PublicPrivate');

sub new{
	my $class = shift;
	my $self = $class->SUPER::new(@_);
	my $private = $self->private;
	
	# initialize one of the private properties
	$private->{'start'}=time();
	
	return $self;
}

#
# Class::PublicPrivate::ExtendedClass
###########################################################


###########################################################
# main
#
package main;
my ($var);

$var = Class::PublicPrivate::ExtendedClass->new('key'=>'private');
$var->{'key'} = 'public';

err_comp('public',   $var->{'key'},           'public');
err_comp('private',  $var->private->{'key'},  'private');


#------------------------------------------------------
# err_comp
#
sub err_comp {
	my ($testname, $is, $should) = @_;
	
	if($is ne $should) {
		print STDERR 
			"\n", $testname, "\n",
			"\tis:     $is\n",
			"\tshould: $should\n\n";	
		ok(0);
	}
	
	else
		{ok(1)}
}
#
# err_comp
#------------------------------------------------------


#
# main
###########################################################

