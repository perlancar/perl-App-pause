package App::pause;

use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

our %cli_attrs = do {
    my $p = '/WWW/PAUSE/Simple/';

    (
        script_summary => 'A CLI for PAUSE',
        url => '/WWW/PAUSE/Simple/',
        subcommands => {
            upload       => { url => "${p}upload_files" },
            ls           => { url => "${p}list_files" },
            "ls-dists" => { url => "${p}list_dists" },
            "ls-mods"  => { url => "${p}list_modules" },
            rm           => { url => "${p}delete_files" },
            undelete     => { url => "${p}undelete_files" },
            reindex      => { url => "${p}reindex_files" },
            #password     => { url => "${p}set_password" },
            #'account-info' => { url => "${p}set_account_info" },
            cleanup      => { url => "${p}delete_old_releases" },
        },
        log => 1,
        # since we are also run as pause-unpacked or pause-fatpacked, but want
        # to share config, we hardcode the name here
        config_filename => ['pause.conf'],
    );
};

1;
# ABSTRACT: A CLI for PAUSE

=head1 DESCRIPTION

See included script L<pause>.


=head1 SEE ALSO

L<WWW::PAUSE::Simple>

L<pause>
