use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'TwitMeet' }
BEGIN { use_ok 'TwitMeet::Controller::Auth' }

ok( request('/auth')->is_success, 'Request should succeed' );


