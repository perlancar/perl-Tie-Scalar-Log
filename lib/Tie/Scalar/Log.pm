package Tie::Scalar::Log;

# DATE
# VERSION

use strict;
use warnings;
use Log::ger;

sub TIESCALAR {
    my $class = shift;

    my $val = shift;
    log_trace "TIEHASH(%s, %s)", $class, $val;
    bless {val=>$val}, $class;
}

sub FETCH {
    my $this = shift;
    my $res = $this->{val};
    log_trace "FETCH(): %s", $res;
    $res;
}

sub STORE {
    my ($this, $val) = @_;
    log_trace "STORE(%s)", $val;
    $this->{val} = $val;
}

sub UNTIE {
    my ($this) = @_;
    log_trace "UNTIE()";
}

# DESTROY

1;
# ABSTRACT: Tied scalar that behaves like a regular scalar, but logs operations

=for Pod::Coverage ^(.+)$

=head1 SYNOPSIS

 use Tie::Scalar::Log;

 tie my $scalar, 'Tie::Scalar::Log';

 # use like you would a regular scalar
 $scalar = 'foo';
 ...


=head1 DESCRIPTION

This class implements tie interface for scalar but performs regular scalar
operations, except logging the operation with L<Log::ger>. It's basically used
for testing, benchmarking, or documentation only.


=head1 SEE ALSO

L<perltie>

L<Log::ger>

L<Tie::Array::Log>, L<Tie::Hash::Log>, L<Tie::Handle::Log>.

L<Tie::Scalar>, L<Tie::StdScalar>

L<Tie::Simple>

=cut
