package TwitMeet;

use strict;
use warnings;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

use parent qw/Catalyst/;
use Catalyst qw/
    ConfigLoader
    Static::Simple

    Session
    Session::Store::FastMmap
    Session::State::Cookie
    Session::PerUser

    Authentication
 /;

our $VERSION = '0.01';

# Configure the application.
#
# Note that settings in twitmeet.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.

__PACKAGE__->config(
    name                     => 'TwitMeet',
    "Plugin::Authentication" => {
        default_realm => "twitter",
        realms        => {
            twitter => {
                credential => { class => "Twitter", },

                consumer_key    => 'twitter-consumer_key-here',
                consumer_secret => 'twitter-secret-here',
                callback_url    => 'http://twitmeet.net/accounts/add',

                # you can bypass the above by including
                # "twitter_consumer_key", "twitter_consumer_secret",
                # and "twitter_callback_url" in your Catalyst site
                # configuration or yml file
            },
        },
    },
);

# Start the application
__PACKAGE__->setup();


=head1 NAME

TwitMeet - Catalyst based application

=head1 SYNOPSIS

    script/twitmeet_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<TwitMeet::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Diego Kuperman

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
