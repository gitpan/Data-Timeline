package Data::Timeline;

use strict;
use warnings;


our $VERSION = '0.01';


use base qw(Class::Accessor::Complex Class::Accessor::Constructor);


__PACKAGE__
    ->mk_constructor
    ->mk_array_accessors(qw(entries));


sub merge_timeline {
    my ($self, $timeline) = @_;

    $self->entries(
        sort { $a->timestamp <=> $b->timestamp }
        ($self->entries, $timeline->entries)
    );

    $self;    # for chaining
}


sub filter_timeline_by_type {
    my ($self, $type) = @_;
    Data::Timeline->new(entries => grep { $_->type eq $type } $self->entries);
}


sub filter_timeline_by_date {
    my ($self, $from, $to) = @_;
    Data::Timeline->new(entries =>
        grep { ($from <= $_->timestamp) && ($_->timestamp <= $to) }
        $self->entries
    );
}


1;


__END__



=head1 NAME

Data::Timeline - Timelines

=head1 SYNOPSIS

    my $timeline = Data::Timeline->new;
    $timeline->entries_push(Data::Timeline::Entry->new(...));
    $timeline->merge_timeline($other_timeline);

=head1 DESCRIPTION

This class represents a timeline, which is a collection of timeline entry
objects (see L<Data::Timeline::Entry>).

Data::Timeline inherits from L<Class::Accessor::Complex>,
L<Class::Accessor::Constructor>, and L<Class::Accessor::Constructor::Base>.

=head1 METHODS

=over 4

=item clear_entries

    $obj->clear_entries;

Deletes all elements from the array.

=item count_entries

    my $count = $obj->count_entries;

Returns the number of elements in the array.

=item entries

    my @values    = $obj->entries;
    my $array_ref = $obj->entries;
    $obj->entries(@values);
    $obj->entries($array_ref);

Get or set the array values. If called without an arguments, it returns the
array in list context, or a reference to the array in scalar context. If
called with arguments, it expands array references found therein and sets the
values.

=item entries_clear

    $obj->entries_clear;

Deletes all elements from the array.

=item entries_count

    my $count = $obj->entries_count;

Returns the number of elements in the array.

=item entries_index

    my $element   = $obj->entries_index(3);
    my @elements  = $obj->entries_index(@indices);
    my $array_ref = $obj->entries_index(@indices);

Takes a list of indices and returns the elements indicated by those indices.
If only one index is given, the corresponding array element is returned. If
several indices are given, the result is returned as an array in list context
or as an array reference in scalar context.

=item entries_pop

    my $value = $obj->entries_pop;

Pops the last element off the array, returning it.

=item entries_push

    $obj->entries_push(@values);

Pushes elements onto the end of the array.

=item entries_set

    $obj->entries_set(1 => $x, 5 => $y);

Takes a list of index/value pairs and for each pair it sets the array element
at the indicated index to the indicated value. Returns the number of elements
that have been set.

=item entries_shift

    my $value = $obj->entries_shift;

Shifts the first element off the array, returning it.

=item entries_splice

    $obj->entries_splice(2, 1, $x, $y);
    $obj->entries_splice(-1);
    $obj->entries_splice(0, -1);

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

=item entries_unshift

    $obj->entries_unshift(@values);

Unshifts elements onto the beginning of the array.

=item index_entries

    my $element   = $obj->index_entries(3);
    my @elements  = $obj->index_entries(@indices);
    my $array_ref = $obj->index_entries(@indices);

Takes a list of indices and returns the elements indicated by those indices.
If only one index is given, the corresponding array element is returned. If
several indices are given, the result is returned as an array in list context
or as an array reference in scalar context.

=item pop_entries

    my $value = $obj->pop_entries;

Pops the last element off the array, returning it.

=item push_entries

    $obj->push_entries(@values);

Pushes elements onto the end of the array.

=item set_entries

    $obj->set_entries(1 => $x, 5 => $y);

Takes a list of index/value pairs and for each pair it sets the array element
at the indicated index to the indicated value. Returns the number of elements
that have been set.

=item shift_entries

    my $value = $obj->shift_entries;

Shifts the first element off the array, returning it.

=item splice_entries

    $obj->splice_entries(2, 1, $x, $y);
    $obj->splice_entries(-1);
    $obj->splice_entries(0, -1);

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

=item unshift_entries

    $obj->unshift_entries(@values);

Unshifts elements onto the beginning of the array.

=item merge_timeline

    $timeline->merge_timeline($other_timeline);

Takes a timeline object and merges its entries into this timeline. The
resulting entry collection is sorted by timestamp.

=item filter_timeline_by_type

    my $other_timeline = $timeline->filter_timeline_by_type('iscrobbler');

Takes a string argument and returns a new timeline object containing only
those entries that match the given entry type.

Returns a new timeline object

=item filter_timeline_by_date

    my $other_timeline = $timeline->filter_timeline_by_date($from, $to);

Takes two L<DateTime> objects and returns a new timeline object containing
only those entries that occurred at or after the first argument and at or
before the second argument.

=back

=head1 TAGS

If you talk about this module in blogs, on del.icio.us or anywhere else,
please use the C<datatimeline> tag.

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

