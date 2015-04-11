package Perinci::CmdLine::pause;

# DATE
# VERSION

use 5.010;
use strict;
use warnings;
use Log::Any::IfLOG qw($log);

use parent qw(Perinci::CmdLine::Lite);

use PERLANCAR::File::HomeDir qw(get_my_home_dir);

sub hook_after_read_config_file {
    my ($self, $r) = @_;

    return unless $self->read_config;
    return if $r->{read_config_files} && @{$r->{read_config_files}};

    my $path = get_my_home_dir() . "/.pause";
    return unless -f $path;

    open my($fh), "<", $path or die [500, "Can't read $path: $!"];
    $log->tracef("[pericmd-pause] Reading %s ...", $path);
    $r->{read_config_files} = [$path];
    while (<$fh>) {
        if (/^user\s+(.+)/) { $r->{config}{GLOBAL}{username} = $1 }
        elsif (/^password\s+(.+)/) { $r->{config}{GLOBAL}{password} = $1 }
    }
}

1;
# ABSTRACT: Perinci::CmdLine::Lite subclass for pause

=head1 DESCRIPTION

This class adds a hook_after_read_config_file to read L<CPAN::Uploader>'s config
file in C<~/.pause>. Encrypted C<.pause> is not supported.
