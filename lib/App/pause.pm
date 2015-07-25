package App::pause;

# DATE
# DIST
# VERSION

require WWW::PAUSE::Simple;

our %SPEC;

$SPEC{':package'} = {
    v => 1.1,
    # to avoid confusing users when it does 'pause --version'
    entity_v => $WWW::PAUSE::Simple::VERSION,
};

1;
# ABSTRACT: A CLI for PAUSE

=head1 DESCRIPTION


=head1 SEE ALSO

L<WWW::PAUSE::Simple>

L<pause>
