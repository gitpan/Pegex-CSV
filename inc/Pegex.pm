use strict; use warnings;
package Pegex;
our $VERSION = '0.57';

use Pegex::Parser;

use Exporter 'import';
our @EXPORT = 'pegex';

sub pegex {
    my ($grammar, $receiver, $debug) = @_;
    die "Argument 'grammar' required in function 'pegex'"
        unless $grammar;
    if (not ref $grammar or $grammar->isa('Pegex::Input')) {
        require Pegex::Grammar;
        $grammar = Pegex::Grammar->new(text => $grammar),
    }
    if ($receiver eq '1') {
        $debug = 1;
        $receiver = undef;
    }
    if (not defined $receiver) {
        require Pegex::Tree::Wrap;
        $receiver = Pegex::Tree::Wrap->new;
    }
    elsif (not ref $receiver) {
        eval "require $receiver; 1";
        $receiver = $receiver->new;
    }
    $debug ||= 0;
    return Pegex::Parser->new(
        grammar => $grammar,
        receiver => $receiver,
        debug => $debug,
    );
}

1;
