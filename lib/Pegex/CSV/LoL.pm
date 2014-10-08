package Pegex::CSV::LoL;
use Pegex::Base;
extends 'Pegex::Tree';

sub got_row {
    my ($self, $got) = @_;
    $self->flatten($got);
}

sub got_double {
    $_[1] =~ s/""/"/g;
    return $_[1];
}

1;
