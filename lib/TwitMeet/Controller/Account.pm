package TwitMeet::Controller::Account;

use strict;
use warnings;
use parent 'Catalyst::Controller';

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->res->redirect( $c->uri_for( '/accounts' ) );
}

sub accounts :Path( /accounts ) :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched TwitMeet::Controller::Account in Account.');
}

sub account_add :Path( /accounts/add ) :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched TwitMeet::Controller::Account in Account.');
}

=head1 NAME

TwitMeet::Controller::Account - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

=head2 index

=cut

=head2 accounts

=cut

=head1 AUTHOR

Diego Kuperman

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
