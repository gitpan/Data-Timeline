package Data::Timeline::Builder;

use strict;
use warnings;
use Data::Timeline;
use Data::Timeline::Entry;


our $VERSION = '0.02';


use base qw(Class::Accessor::Complex Class::Accessor::Constructor);


__PACKAGE__
    ->mk_constructor
    ->mk_abstract_accessors(qw(create));


sub make_timeline {
    my $self = shift;
    Data::Timeline->new(@_)
}


sub make_entry {
    my $self = shift;
    Data::Timeline::Entry->new(@_)
}


1;


__END__



=head1 NAME

Data::Timeline::Builder - Base class for timeline builders

=head1 SYNOPSIS

    Data::Timeline::Builder->new;

    package Data::Timeline::SVK;
    use base 'Data::Timeline::Builder';

    sub create {
        my $self = shift;
        my $timeline = $self->make_timeline;
        for (...) {
            ...
            $timeline->entries_push($self->make_entry(
                timestamp   => ...,
                description => ...,
                type        => 'svk',
            ));
        }
        $timeline;
    }

=head1 DESCRIPTION

This is a base class for timeline builders. Subclasses need to implement the
C<create()> method.

Data::Timeline::Builder inherits from L<Class::Accessor::Complex>,
L<Class::Accessor::Constructor>, and L<Class::Accessor::Constructor::Base>.

The superclass L<Class::Accessor::Complex> defines these methods and
functions:

    carp(), cluck(), croak(), flatten(), mk_abstract_accessors(),
    mk_array_accessors(), mk_boolean_accessors(),
    mk_class_array_accessors(), mk_class_hash_accessors(),
    mk_class_scalar_accessors(), mk_concat_accessors(),
    mk_forward_accessors(), mk_hash_accessors(), mk_integer_accessors(),
    mk_new(), mk_object_accessors(), mk_scalar_accessors(),
    mk_set_accessors(), mk_singleton()

The superclass L<Class::Accessor> defines these methods and functions:

    _carp(), _croak(), _mk_accessors(), accessor_name_for(),
    best_practice_accessor_name_for(), best_practice_mutator_name_for(),
    follow_best_practice(), get(), make_accessor(), make_ro_accessor(),
    make_wo_accessor(), mk_accessors(), mk_ro_accessors(),
    mk_wo_accessors(), mutator_name_for(), set()

The superclass L<Class::Accessor::Installer> defines these methods and
functions:

    install_accessor(), subname()

The superclass L<Class::Accessor::Constructor> defines these methods and
functions:

    NO_DIRTY(), WITH_DIRTY(), _make_constructor(), mk_constructor(),
    mk_constructor_with_dirty(), mk_singleton_constructor()

The superclass L<Data::Inherited> defines these methods and functions:

    every_hash(), every_list(), flush_every_cache_by_key()

The superclass L<Class::Accessor::Constructor::Base> defines these methods
and functions:

    HYGIENIC(), STORE(), clear_dirty(), clear_hygienic(),
    clear_unhygienic(), contains_hygienic(), contains_unhygienic(),
    delete_hygienic(), delete_unhygienic(), dirty(), dirty_clear(),
    dirty_set(), elements_hygienic(), elements_unhygienic(), hygienic(),
    hygienic_clear(), hygienic_contains(), hygienic_delete(),
    hygienic_elements(), hygienic_insert(), hygienic_is_empty(),
    hygienic_size(), insert_hygienic(), insert_unhygienic(),
    is_empty_hygienic(), is_empty_unhygienic(), set_dirty(),
    size_hygienic(), size_unhygienic(), unhygienic(), unhygienic_clear(),
    unhygienic_contains(), unhygienic_delete(), unhygienic_elements(),
    unhygienic_insert(), unhygienic_is_empty(), unhygienic_size()

The superclass L<Tie::StdHash> defines these methods and functions:

    CLEAR(), DELETE(), EXISTS(), FETCH(), FIRSTKEY(), NEXTKEY(), SCALAR(),
    TIEHASH()

=head1 METHODS

=over 4

=item new

    my $obj = Data::Timeline::Builder->new;
    my $obj = Data::Timeline::Builder->new(%args);

Creates and returns a new object. The constructor will accept as arguments a
list of pairs, from component name to initial value. For each pair, the named
component is initialized by calling the method of the same name with the given
value. If called with a single hash reference, it is dereferenced and its
key/value pairs are set as described before.

=item make_timeline

    my $timeline = $self->make_timeline;

Convenience method; returns a new L<Data::Timeline> object. Any arguments are
passed to C<Data::Timeline->new()>.

=item make_entry

    $timeline->entries_push($self->make_entry(...));

Convenience method; returns a new L<Data::Timeline::Entry> object. Any
arguments are passed to C<Data::Timeline::Entry->new()>.

=back

=head1 TAGS

If you talk about this module in blogs, on del.icio.us or anywhere else,
please use the C<datatimeline> tag.

=head1 VERSION 
                   
This document describes version 0.02 of L<Data::Timeline::Builder>.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<<bug-data-timeline@rt.cpan.org>>, or through the web interface at
L<http://rt.cpan.org>.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit <http://www.perl.com/CPAN/> to find a CPAN
site near you. Or see <http://www.perl.com/CPAN/authors/id/M/MA/MARCEL/>.

=head1 AUTHOR

Marcel GrE<uuml>nauer, C<< <marcel@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2007 by Marcel GrE<uuml>nauer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.


=cut

