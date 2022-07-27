<?php
define('FORCE_SSL_ADMIN', true);

/** $_SERVER['REQUEST_URI'] = str_replace("/wp-admin/", "/blog/wp-admin/",  $_SERVER['REQUEST_URI']); */

if($_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https'){

    $_SERVER['HTTPS'] = 'on';
    $_SERVER['SERVER_PORT'] = 443;
}

define('WP_HOME', '{{ WP_HOME }}' );
define('WP_SITEURL', '{{ WP_SITEURL }}'); 
/**
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', '{{ WP_DB_NAME }}' );

/** MySQL database username */
define( 'DB_USER', '{{ WP_DB_USER }}' );

/** MySQL database password */
define( 'DB_PASSWORD', '{{ WP_DB_PASS }}' );

/** MySQL hostname */
define( 'DB_HOST', '{{ WP_DB_HOST }}' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define('WP_PROXY_HOST', '{{ WP_PROXY_HOST }}');
define('WP_PROXY_PORT', '{{ WP_PROXY_PORT }}' );
define('WP_PROXY_USERNAME', '');
define('WP_PROXY_PASSWORD', '');
define('WP_PROXY_BYPASS_HOSTS', 'localhost');

/** Filesystem access **/
define('FS_METHOD', 'direct');

define( 'AUTH_KEY',         '{{ lookup('password', '/dev/null chars=ascii_letters length=64') }}' );
define( 'SECURE_AUTH_KEY',  '{{ lookup('password', '/dev/null chars=ascii_letters length=64') }}' );
define( 'LOGGED_IN_KEY',    '{{ lookup('password', '/dev/null chars=ascii_letters length=64') }}' );
define( 'NONCE_KEY',        '{{ lookup('password', '/dev/null chars=ascii_letters length=64') }}' );
define( 'AUTH_SALT',        '{{ lookup('password', '/dev/null chars=ascii_letters length=64') }}' );
define( 'SECURE_AUTH_SALT', '{{ lookup('password', '/dev/null chars=ascii_letters length=64') }}' );
define( 'LOGGED_IN_SALT',   '{{ lookup('password', '/dev/null chars=ascii_letters length=64') }}' );
define( 'NONCE_SALT',       '{{ lookup('password', '/dev/null chars=ascii_letters length=64') }}' );


$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

require_once( ABSPATH . 'wp-settings.php' );