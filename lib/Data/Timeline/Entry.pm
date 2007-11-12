package Data::Timeline::Entry;

use strict;
use warnings;


our $VERSION = '0.01';


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

=head1 METHODS

=over 4

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

