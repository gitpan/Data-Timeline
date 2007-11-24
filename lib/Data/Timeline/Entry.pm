package Data::Timeline::Entry;

use strict;
use warnings;


our $VERSION = '0.02';


use base qw(Class::Accessor::Complex Class::Accessor::Constructor);


__PACKAGE__
    ->mk_constructor
    ->mk_scalar_accessors(qw(timestamp type description));


1;


__END__



=head1 NAME

Data::Timeline::Entry - A timeline entry

=head1 SYNOPSIS

    my $entry = Data::Timeline::Entry->new(
        timestamp   => ...,
        type        => '...',
        description => '...',
    );

=head1 DESCRIPTION

This class represents a timeline entry. An entry has a timestamp, a type and a
description. The timestamp needs to be a L<DateTime> object. The type is
freely definable, but you need to be consistent. If you want to display
multiple timelines side-by-side you probably need to define the entry type for
each column. The description is a string that says what this entry is about.

Data::Timeline::Entry inherits from L<Class::Accessor::Complex>,
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

    my $obj = Data::Timeline::Entry->new;
    my $obj = Data::Timeline::Entry->new(%args);

Creates and returns a new object. The constructor will accept as arguments a
list of pairs, from component name to initial value. For each pair, the named
component is initialized by calling the method of the same name with the given
value. If called with a single hash reference, it is dereferenced and its
key/value pairs are set as described before.

=item clear_description

    $obj->clear_description;

Clears the value.

=item clear_timestamp

    $obj->clear_timestamp;

Clears the value.

=item clear_type

    $obj->clear_type;

Clears the value.

=item description

    my $value = $obj->description;
    $obj->description($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item description_clear

    $obj->description_clear;

Clears the value.

=item timestamp

    my $value = $obj->timestamp;
    $obj->timestamp($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item timestamp_clear

    $obj->timestamp_clear;

Clears the value.

=item type

    my $value = $obj->type;
    $obj->type($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item type_clear

    $obj->type_clear;

Clears the value.

=back

=head1 TAGS

If you talk about this module in blogs, on del.icio.us or anywhere else,
please use the C<datatimeline> tag.

=head1 VERSION 
                   
This document describes version 0.02 of L<Data::Timeline::Entry>.

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

