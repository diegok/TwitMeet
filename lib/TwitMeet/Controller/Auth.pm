package TwitMeet::Controller::Auth;

use strict;
use warnings;
use parent 'Catalyst::Controller';

=head1 NAME

TwitMeet::Controller::Auth - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

sub login : Path( /login ) Args(0) {
    my ($self, $c) = @_;
    
    my $realm = $c->get_auth_realm('twitter');
    $c->res->redirect( $realm->credential->authenticate_twitter_url($c) );
 }

=head2 callback

=cut
sub callback : Private {
    my ( $self, $c ) = @_;

    if ( my $user = $c->authenticate( undef, 'twitter' ) ) {

        # user has an account - redirect or do something cool
        $c->res->redirect("/accounts");
    }
    else {

        # user doesn't have an account - either detect Twitter
        # credentials and create one, or return an error.
        #
        # Note that "request_token" and "request_token_secret"
        # are stored in $c->user_session as hashref variables under
        # the same names
    }
}

=head1 AUTHOR

Diego Kuperman

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
