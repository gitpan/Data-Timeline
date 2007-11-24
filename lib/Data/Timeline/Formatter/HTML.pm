package Data::Timeline::Formatter::HTML;

use strict;
use warnings;
use HTML::Table;


our $VERSION = '0.02';


use base qw(Data::Timeline::Formatter);


__PACKAGE__->mk_array_accessors(qw(columns));


sub format {
    my ($self, $timeline) = @_;
    my $table = HTML::Table->new(
        -head => [ 'timestamp', $self->columns ],
    );

    for my $entry ($timeline->entries) {
        my @row = (sprintf "%s" => $entry->timestamp);
        for my $col_type ($self->columns) {
            if ($entry->type eq $col_type) {
                push @row => $entry->description;
            } else {
                push @row => '';
            }
        }
        $table->addRow(@row);
    }

    $table->print;
}


1;


__END__



=head1 NAME

Data::Timeline::Formatter::HTML - Print timeline entry types side-by-side in an HTML table

=head1 SYNOPSIS

    Data::Timeline::Formatter::HTML->new(
        columns => [ qw(iscrobbler svk) ],
    )->format($timeline);

=head1 DESCRIPTION

This class is a timeline formatter. It takes a timeline containing entries of
one or more entry types and a column definition. The column definition says
for each column which type of entries it should contain. The formatter's
C<format()> method will then print a simple HTML table containing the
requested columns, with a column for the timestamp at the beginning.

The column definition is a list of entry type strings. pairs. So for the
example in the synopsis, the first column would contain the timestamp, the
second column would contain C<iscrobbler> entries, produced by
L<Data::Timeline::IScrobbler>, and the third column would contain C<svk>
entries, produced by L<Data::Timeline::SVK>.

Data::Timeline::Formatter::HTML inherits from L<Data::Timeline::Formatter>.

The superclass L<Data::Timeline::Formatter> defines these methods and
functions:

    new()

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

=item clear_columns

    $obj->clear_columns;

Deletes all elements from the array.

=item columns

    my @values    = $obj->columns;
    my $array_ref = $obj->columns;
    $obj->columns(@values);
    $obj->columns($array_ref);

Get or set the array values. If called without an arguments, it returns the
array in list context, or a reference to the array in scalar context. If
called with arguments, it expands array references found therein and sets the
values.

=item columns_clear

    $obj->columns_clear;

Deletes all elements from the array.

=item columns_count

    my $count = $obj->columns_count;

Returns the number of elements in the array.

=item columns_index

    my $element   = $obj->columns_index(3);
    my @elements  = $obj->columns_index(@indices);
    my $array_ref = $obj->columns_index(@indices);

Takes a list of indices and returns the elements indicated by those indices.
If only one index is given, the corresponding array element is returned. If
several indices are given, the result is returned as an array in list context
or as an array reference in scalar context.

=item columns_pop

    my $value = $obj->columns_pop;

Pops the last element off the array, returning it.

=item columns_push

    $obj->columns_push(@values);

Pushes elements onto the end of the array.

=item columns_set

    $obj->columns_set(1 => $x, 5 => $y);

Takes a list of index/value pairs and for each pair it sets the array element
at the indicated index to the indicated value. Returns the number of elements
that have been set.

=item columns_shift

    my $value = $obj->columns_shift;

Shifts the first element off the array, returning it.

=item columns_splice

    $obj->columns_splice(2, 1, $x, $y);
    $obj->columns_splice(-1);
    $obj->columns_splice(0, -1);

Takes three arguments: An offset, a length and a list.

Removes the elements designated by the offset and the length from the array,
and replaces them with the elements of the list, if any. In list context,
returns the elements removed from the array. In scalar context, returns the
last element removed, or C<undef> if no elements are removed. The array grows
or shrinks as necessary. If the offset is negative then it starts that far
from the end of the array. If the length is omitted, removes everything from
the offset onward. If the length is negative, removes the elements from the
offset onward except for -length elements at the end of the array. If both the
offset and the length are omitted, removes everything. If the offset is past
the end of the array, it issues a warning, and splices at the end of the
array.

=item columns_unshift

    $obj->columns_unshift(@values);

Unshifts elements onto the beginning of the array.

=item count_columns

    my $count = $obj->count_columns;

Returns the number of elements in the array.

=item index_columns

    my $element   = $obj->index_columns(3);
    my @elements  = $obj->index_columns(@indices);
    my $array_ref = $obj->index_columns(@indices);

Takes a list of indices and returns the elements indicated by those indices.
If only one index is given, the corresponding array element is returned. If
several indices are given, the result is returned as an array in list context
or as an array reference in scalar context.

=item pop_columns

    my $value = $obj->pop_columns;

Pops the last element off the array, returning it.

=item push_columns

    $obj->push_columns(@values);

Pushes elements onto the end of the array.

=item set_columns

    $obj->set_columns(1 => $x, 5 => $y);

Takes a list of index/value pairs and for each pair it sets the array element
at the indicated index to the indicated value. Returns the number of elements
that have been set.

=item shift_columns

    my $value = $obj->shift_columns;

Shifts the first element off the array, returning it.

=item splice_columns

    $obj->splice_columns(2, 1, $x, $y);
    $obj->splice_columns(-1);
    $obj->splice_columns(0, -1);

Takes three arguments: An offset, a length and a list.

Removes the elements designated by the offset and the length from the array,
and replaces them with the elements of the list, if any. In list context,
returns the elements removed from the array. In scalar context, returns the
last element removed, or C<undef> if no elements are removed. The array grows
or shrinks as necessary. If the offset is negative then it starts that far
from the end of the array. If the length is omitted, removes everything from
the offset onward. If the length is negative, removes the elements from the
offset onward except for -length elements at the end of the array. If both the
offset and the length are omitted, removes everything. If the offset is past
the end of the array, it issues a warning, and splices at the end of the
array.

=item unshift_columns

    $obj->unshift_columns(@values);

Unshifts elements onto the beginning of the array.

=item format

    $formatter->format($timeline);

Takes a timeline and formats it as described above.

=back

=head1 TAGS

If you talk about this module in blogs, on del.icio.us or anywhere else,
please use the C<datatimeline> tag.

=head1 VERSION 
                   
This document describes version 0.02 of L<Data::Timeline::Formatter::HTML>.

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

