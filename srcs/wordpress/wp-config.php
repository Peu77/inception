<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wordpress' );

/** Database password */
define( 'DB_PASSWORD', 'wordpress' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'NM67GOM4+1f2gTaB0sIKCEm5dWUKpsdDDjy+WEz14Z4CSixaj5Qy49JitQsg7zFN' );
define( 'SECURE_AUTH_KEY',  'HwEACpCVaPsT9MB/fqy30thWZIOjBc13BpUAxqh7ZtLa64e2wJ8q9gZtk2Mv66jl' );
define( 'LOGGED_IN_KEY',    'Om2CAEXKfKXYTj+fSnk/JkTG88YUi9AA7VCkqjOvFQ1OMyZraf2c+ZWPaeXefIMY' );
define( 'NONCE_KEY',        'Uy6nqCDoQXEUiLGxj7WuQxtwOchAll3LUQyUHrXPEIzNweZTEu7tbrQOrSGZ0TQK' );
define( 'AUTH_SALT',        'uN51EP3o76sFPCiWPdRrQ6NIoZGdU3Kv1M8jWh08wbMbxa8VSbjApt4jDLqkoVN5' );
define( 'SECURE_AUTH_SALT', 'v2HpSkIDB92SCWCWdKaCF9vrRdV8CCm9hAXda76xt+10toAiFeDcpJdoAjMz9WVI' );
define( 'LOGGED_IN_SALT',   'ixdvmqMKYGL23ENkNhtbXg+LJ5pbmbG7PNqQSwdduA2Kq4PH6jcOuN4dCgCVEQWe' );
define( 'NONCE_SALT',       'F+bGYrM98MiMV8NjSvUaczXC5FiZRd8NkyBAWQ7kx8/29ocbLpahDmdqhSJc9EOH' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 *
 * At the installation time, database tables are created with the specified prefix.
 * Changing this value after WordPress is installed will make your site think
 * it has not been installed.
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/#table-prefix
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}
define('WP_HOME', 'https://eebert.42.fr');
define('WP_SITEURL', 'https://eebert.42.fr');
define('COOKIE_DOMAIN', 'eebert.42.fr');
define('SITECOOKIEPATH', '/');
$_SERVER['HTTP_HOST'] = "eebert.42.fr";
$_SERVER['REMOTE_ADDR'] = "https://eebert.42.fr";
$_SERVER['SERVER_ADDR'] = "eebert.42.fr";
if(isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
    $list = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
    $_SERVER['REMOTE_ADDR'] = $list[0];
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';