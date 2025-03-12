<?php
/**
 * phpMyAdmin sample configuration, you can use it as base for
 * manual configuration. For easier setup you can use setup/
 *
 * All directives are explained in documentation in the doc/ folder
 * or at <https://docs.phpmyadmin.net/>.
 */

declare(strict_types=1);

/**
 * This is needed for cookie based authentication to encrypt password in
 * cookie. Needs to be 32 chars long.
 */
$cfg['blowfish_secret'] = 'R7cTGGaJk5WeEWyiXRUUr56LQQkHinyE'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */
$cfg['ForceSSL'] = true;
$cfg['LoginCookieValidity'] = 1440;
$cfg['VersionCheck'] = true;
$cfg['PmaNoRelation_DisableWarning'] = TRUE;

/**
 * Servers configuration
 */
$i = 0;

/**
 * First server
 */
$i++;

$cfg['Servers'][$i]['host']          = 'mariadb-comboom.sucht'; // MySQL hostname or IP address
$cfg['Servers'][$i]['port']          = '3306';      // MySQL port - leave blank for default port
$cfg['Servers'][$i]['extension']     = 'mysql';     // The php MySQL extension to use ('mysql' or 'mysqli')
$cfg['Servers'][$i]['compress']      = false;       // Use compressed protocol for the MySQL connection
                                                    // (requires PHP >= 4.3.0)
$cfg['Servers'][$i]['auth_type']     = 'cookie';    // Authentication method (config, http or cookie based)?
$cfg['Servers'][$i]['AllowNoPassword'] = true;
$cfg['Servers'][$i]['AllowRoot'] = false;


/**
 * phpMyAdmin configuration storage settings.
 */

/* User used to manipulate with storage */
$cfg['Servers'][$i]['controlhost'] = 'mariadb-comboom.sucht';
$cfg['Servers'][$i]['controlport'] = '3306';
$cfg['Servers'][$i]['controluser'] = 'phpMyAdmin';
$cfg['Servers'][$i]['controlpass'] = '&vFy)QFHwP@TOo$v*%))iYDJUn*FGoGH8!wWH#-T6BRnfEjqni7tLZs_nDC+B+JrX(vE4g6^J)2dxHMnZA47F-o4D%nh9Y+rMs*7xdyRl3654Lf#=w^zBHj8P76z*!kL';

/* Storage database and tables */
$cfg['Servers'][$i]['pmadb'] = 'phpmyadmin';
$cfg['Servers'][$i]['bookmarktable'] = 'pma__bookmark';
$cfg['Servers'][$i]['relation'] = 'pma__relation';
$cfg['Servers'][$i]['table_info'] = 'pma__table_info';
$cfg['Servers'][$i]['table_coords'] = 'pma__table_coords';
$cfg['Servers'][$i]['pdf_pages'] = 'pma__pdf_pages';
$cfg['Servers'][$i]['column_info'] = 'pma__column_info';
$cfg['Servers'][$i]['history'] = 'pma__history';
$cfg['Servers'][$i]['table_uiprefs'] = 'pma__table_uiprefs';
$cfg['Servers'][$i]['tracking'] = 'pma__tracking';
$cfg['Servers'][$i]['userconfig'] = 'pma__userconfig';
$cfg['Servers'][$i]['recent'] = 'pma__recent';
$cfg['Servers'][$i]['favorite'] = 'pma__favorite';
$cfg['Servers'][$i]['users'] = 'pma__users';
$cfg['Servers'][$i]['usergroups'] = 'pma__usergroups';
$cfg['Servers'][$i]['navigationhiding'] = 'pma__navigationhiding';
$cfg['Servers'][$i]['savedsearches'] = 'pma__savedsearches';
$cfg['Servers'][$i]['central_columns'] = 'pma__central_columns';
$cfg['Servers'][$i]['designer_settings'] = 'pma__designer_settings';
$cfg['Servers'][$i]['export_templates'] = 'pma__export_templates';

/**
 * End of servers configuration
 */

/**
 * Directories for saving/loading files from server
 */
$cfg['UploadDir'] = '/etc/phpmyadmin/upload';
$cfg['SaveDir'] = '/etc/phpmyadmin/save';
$cfg['TempDir'] = '/etc/phpmyadmin/tmp';

/**
 * Whether to display icons or text or both icons and text in table row
 * action segment. Value can be either of 'icons', 'text' or 'both'.
 * default = 'both'
 */
$cfg['RowActionType'] = 'both';

/**
 * Defines whether a user should be displayed a "show all (records)"
 * button in browse mode or not.
 * default = false
 */
$cfg['ShowAll'] = true;

/**
 * Number of rows displayed when browsing a result set. If the result
 * set contains more rows, "Previous" and "Next".
 * Possible values: 25, 50, 100, 250, 500
 * default = 25
 */
$cfg['MaxRows'] = 500;

/**
 * Disallow editing of binary fields
 * valid values are:
 *   false    allow editing
 *   'blob'   allow editing except for BLOB fields
 *   'noblob' disallow editing except for BLOB fields
 *   'all'    disallow editing
 * default = 'blob'
 */
$cfg['ProtectBinary'] = false;

/**
 * Default language to use, if not browser-defined or user-defined
 * (you find all languages in the locale folder)
 * uncomment the desired line:
 * default = 'en'
 */
$cfg['DefaultLang'] = 'de';
$cfg['DefaultConnectionCollation'] = 'utf8mb4_uca1400_german2_as_cs';

$cfg['Lang'] = 'en';
$cfg['FilterLanguages'] = '(en|de)';

$cfg['ThemeDefault'] = 'boodark-nord';
$cfg['ThemeManager'] = true;
$cfg['Console']['DarkTheme'] = true;
$cfg['Console']['StartHistory'] = true;
$cfg['Console']['EnterExecutes'] = true;
$cfg['Console']['CurrentQuery'] = true;
$cfg['Console']['Mode'] = 'collapse';
/**
 * How many columns should be used for table display of a database?
 * (a value larger than 1 results in some information being hidden)
 * default = 1
 */
$cfg['PropertiesNumColumns'] = 2;

/**
 * Set to true if you want DB-based query history.If false, this utilizes
 * JS-routines to display query history (lost by window close)
 *
 * This requires configuration storage enabled, see above.
 * default = false
 */
$cfg['QueryHistoryDB'] = true;

/**
 * When using DB-based query history, how many entries should be kept?
 * default = 25
 */
$cfg['QueryHistoryMax'] = 100;

/**
 * Whether or not to query the user before sending the error report to
 * the phpMyAdmin team when a JavaScript error occurs
 *
 * Available options
 * ('ask' | 'always' | 'never')
 * default = 'ask'
 */
$cfg['SendErrorReports'] = 'always';

/**
 * 'URLQueryEncryption' defines whether phpMyAdmin will encrypt sensitive data from the URL query string.
 * 'URLQueryEncryptionSecretKey' is a 32 bytes long secret key used to encrypt/decrypt the URL query string.
 */
$cfg['URLQueryEncryption'] = true;
$cfg['URLQueryEncryptionSecretKey'] = 'R7cTGGaJk5WeEWyiXRUUr56LQQkHinyE';
/**
 * You can find more configuration options in the documentation
 * in the doc/ folder or at <https://docs.phpmyadmin.net/>.
 */
