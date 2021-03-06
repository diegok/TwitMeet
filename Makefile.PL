#!/usr/bin/env perl
# IMPORTANT: if you delete this file your app will not work as
# expected.  You have been warned.
use inc::Module::Install;

name 'TwitMeet';
all_from 'lib/TwitMeet.pm';

requires 'Catalyst::Runtime' => '5.8002';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'parent';
requires 'Config::General'; # This should reflect the config file format you've chosen
requires 'Catalyst::Authentication::Credential::Twitter';

catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
