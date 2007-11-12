package Data::Timeline::Builder;

use strict;
use warnings;
use Data::Timeline;
use Data::Timeline::Entry;


our $VERSION = '0.01';


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

=head1 METHODS

=over 4



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

