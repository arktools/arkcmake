#cmakedefine APPLICATION_NAME "@APPLICATION_NAME@"
#cmakedefine APPLICATION_VERSION "@APPLICATION_VERSION@"
#cmakedefine INSTALL_LIB_SUFFIX "@INSTALL_LIB_SUFFIX@"
#cmakedefine INSTALL_EXEC_PREFIX "@INSTALL_EXEC_PREFIX@"
#cmakedefine INSTALL_SHARE_PREFIX "@INSTALL_SHARE_PREFIX@"
#cmakedefine INSTALL_DATA_PREFIX "@INSTALL_DATA_PREFIX@"
#cmakedefine INSTALL_BIN_DIR "@INSTALL_BIN_DIR@"
#cmakedefine INSTALL_SBIN_DIR "@INSTALL_SBIN_DIR@"
#cmakedefine INSTALL_LIB_DIR "@INSTALL_LIB_DIR@"
#cmakedefine INSTALL_LIBEXEC_DIR "@INSTALL_LIBEXEC_DIR@"
#cmakedefine INSTALL_PLUGIN_DIR "@INSTALL_PLUGIN_DIR@"
#cmakedefine INSTALL_INCLUDE_DIR "@INSTALL_INCLUDE_DIR@"
#cmakedefine INSTALL_DATA_DIR "@INSTALL_DATA_DIR@"
#cmakedefine INSTALL_HTML_DIR "@INSTALL_HTML_DIR@"
#cmakedefine INSTALL_ICON_DIR "@INSTALL_ICON_DIR@"
#cmakedefine INSTALL_SOUND_DIR "@INSTALL_SOUND_DIR@"
#cmakedefine INSTALL_LOCALE_DIR "@INSTALL_LOCALE_DIR@"
#cmakedefine INSTALL_XDG_APPS_DIR "@INSTALL_XDG_APPS_DIR@"
#cmakedefine INSTALL_XDG_DIRECTORY_DIR "@INSTALL_XDG_DIRECTORY_DIR@"
#cmakedefine INSTALL_SYSCONF_DIR "@INSTALL_SYSCONF_DIR@"
#cmakedefine INSTALL_MAN_DIR "@INSTALL_MAN_DIR@"
#cmakedefine INSTALL_INFO_DIR "@INSTALL_INFO_DIR@"

/************************** HEADER FILES *************************/


/* Define to 1 if you have the <termios.h> header file. */
#cmakedefine HAVE_TERMIOS_H 1

/* Define to 1 if you have the <pthread.h> header file. */
#cmakedefine HAVE_PTHREAD_H 1


/*************************** FUNCTIONS ***************************/

/* Define to 1 if you have the `snprintf' function. */
#cmakedefine HAVE_SNPRINTF 1

/*************************** LIBRARIES ***************************/

/* Define to 1 if you have the `pthread' library (-lpthread). */
#cmakedefine HAVE_PTHREAD 1


/**************************** OPTIONS ****************************/

#cmakedefine WITH_GUI 1 
#cmakedefine WITH_ARKOSG 1

/*************************** ENDIAN *****************************/

/* Define WORDS_BIGENDIAN to 1 if your processor stores words with the most
   significant byte first (like Motorola and SPARC, unlike Intel). */
#cmakedefine WORDS_BIGENDIAN 1
