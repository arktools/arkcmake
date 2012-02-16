# application name
if (NOT APPLICATION_NAME)
    message(STATUS "${PROJECT_NAME} is used as APPLICATION_NAME")
    set(APPLICATION_NAME ${PROJECT_NAME} INTERNAL)
endif (NOT APPLICATION_NAME)

# library settings
set(INSTALL_LIB_SUFFIX CACHE STRING "Define suffix of directory name (32/64)")

# install prefixes
set(INSTALL_EXEC_PREFIX "${CMAKE_INSTALL_PREFIX}" CACHE PATH  "Base directory for executables and libraries")
set(INSTALL_SHARE_PREFIX "${CMAKE_INSTALL_PREFIX}/share" CACHE PATH "Base directory for files which go to share/")
set(INSTALL_DATA_PREFIX "${SHARE_PREFIX}/${APPLICATION_NAME}" CACHE PATH "The parent directory where applications can install their data")

# The following are directories where stuff will be installed to
set(INSTALL_BIN_DIR "${EXEC_INSTALL_PREFIX}/bin" CACHE PATH "The ${APPLICATION_NAME} binary install dir (default prefix/bin)")
set(INSTALL_SBIN_DIR "${EXEC_INSTALL_PREFIX}/sbin" CACHE PATH "The ${APPLICATION_NAME} sbin install dir (default prefix/sbin)")
set(INSTALL_LIB_DIR "${EXEC_INSTALL_PREFIX}/lib${LIB_SUFFIX}" CACHE PATH "The subdirectory relative to the install prefix where libraries will be installed (default is prefix/lib)")
set(INSTALL_LIBEXEC_DIR "${EXEC_INSTALL_PREFIX}/libexec" CACHE PATH "The subdirectory relative to the install prefix where libraries will be installed (default is prefix/libexec)")
set(INSTALL_PLUGIN_DIR "${LIB_DIR}/${APPLICATION_NAME}" CACHE PATH "The subdirectory relative to the install prefix where plugins will be installed (default is prefix/lib/${APPLICATION_NAME})")
set(INSTALL_INCLUDE_DIR "${CMAKE_INSTALL_PREFIX}/include" CACHE PATH "The subdirectory to the header prefix (default prefix/include)")
set(INSTALL_DATA_DIR "${DATA_INSTALL_PREFIX}" CACHE PATH "The parent directory where applications can install their data (default prefix/share/${APPLICATION_NAME})")
set(INSTALL_HTML_DIR "${DATA_INSTALL_PREFIX}/doc/HTML" CACHE PATH "The HTML install dir for documentation (default data/doc/html)")
set(INSTALL_ICON_DIR "${DATA_INSTALL_PREFIX}/icons" CACHE PATH "The icon install dir (default data/icons/)")
set(INSTALL_SOUND_DIR "${DATA_INSTALL_PREFIX}/sounds" CACHE PATH "The install dir for sound files (default data/sounds)")
set(INSTALL_LOCALE_DIR "${SHARE_INSTALL_PREFIX}/locale" CACHE PATH "The install dir for translations (default prefix/share/locale)")
set(INSTALL_XDG_APPS_DIR "${SHARE_INSTALL_PREFIX}/applications/" CACHE PATH "The XDG apps dir")
set(INSTALL_XDG_DIRECTORY_DIR "${SHARE_INSTALL_PREFIX}/desktop-directories" CACHE PATH "The XDG directory")
set(INSTALL_SYSCONF_DIR "${EXEC_INSTALL_PREFIX}/etc" CACHE PATH "The ${APPLICATION_NAME} sysconfig install dir (default prefix/etc)")
set(INSTALL_MAN_DIR "${SHARE_INSTALL_PREFIX}/man" CACHE PATH "The ${APPLICATION_NAME} man install dir (default prefix/man)")
set(INSTALL_INFO_DIR "${SHARE_INSTALL_PREFIX}/info" CACHE PATH "The ${APPLICATION_NAME} info install dir (default prefix/info)")
