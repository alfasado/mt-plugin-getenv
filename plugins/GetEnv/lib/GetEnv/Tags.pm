package GetEnv::Tags;

use strict;

sub _hdlr_get_env {
    my ( $ctx, $args, $cond ) = @_;
    if ( _is_application() ) {
        my $env = $args->{ name };
        return $ENV{ $env };
    }
    return '';
}

sub _hdlr_get_cookie {
    my ( $ctx, $args, $cond ) = @_;
    if ( _is_application() ) {
        my $name = $args->{ name };
        return MT->instance->cookie_val( $name );
    }
    return '';
}

sub _is_application {
    my $app = shift || MT->instance();
    return (ref $app) =~ /^MT::App::/ ? 1 : 0;
}

1;