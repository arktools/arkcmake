# application name
if (NOT APPLICATION_NAME)
    message(STATUS "${PROJECT_NAME} is used as APPLICATION_NAME")
    set(APPLICATION_NAME ${PROJECT_NAME} INTERNAL)
endif (NOT APPLICATION_NAME)

# library settings
set(LIB_SUFFIX CACHE STRING "Define suffix of directory name (32/64)")

# install prefixes
set(EXEC_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}" CACHE PATH  "Base directory for executables and libraries")
set(SHARE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}/share" CACHE PATH "Base directory for files which go to share/")
set(DATA_INSTALL_PREFIX "${SHARE_INSTALL_PREFIX}/${APPLICATION_NAME}" CACHE PATH "The parent directory where applications can install their data")

# The following are directories where stuff will be installed to
set(BIN_INSTALL_DIR "${EXEC_INSTALL_PREFIX}/bin" CACHE PATH "The ${APPLICATION_NAME} binary install dir (default prefix/bin)")
set(SBIN_INSTALL_DIR "${EXEC_INSTALL_PREFIX}/sbin" CACHE PATH "The ${APPLICATION_NAME} sbin install dir (default prefix/sbin)")
set(LIB_INSTALL_DIR "${EXEC_INSTALL_PREFIX}/lib${LIB_SUFFIX}" CACHE PATH "The subdirectory relative to the install prefix where libraries will be installed (default is prefix/lib)")
set(LIBEXEC_INSTALL_DIR "${EXEC_INSTALL_PREFIX}/libexec" CACHE PATH "The subdirectory relative to the install prefix where libraries will be installed (default is prefix/libexec)")
set(PLUGIN_INSTALL_DIR "${LIB_INSTALL_DIR}/${APPLICATION_NAME}" CACHE PATH "The subdirectory relative to the install prefix where plugins will be installed (default is prefix/lib/${APPLICATION_NAME})")
set(INCLUDE_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/include" CACHE PATH "The subdirectory to the header prefix (default prefix/include)")
set(DATA_INSTALL_DIR "${DATA_INSTALL_PREFIX}" CACHE PATH "The parent directory where applications can install their data (default prefix/share/${APPLICATION_NAME})")
set(HTML_INSTALL_DIR "${DATA_INSTALL_PREFIX}/doc/HTML" CACHE PATH "The HTML install dir for documentation (default data/doc/html)")
set(ICON_INSTALL_DIR "${DATA_INSTALL_PREFIX}/icons" CACHE PATH "The icon install dir (default data/icons/)")
set(SOUND_INSTALL_DIR "${DATA_INSTALL_PREFIX}/sounds" CACHE PATH "The install dir for sound files (default data/sounds)")
set(LOCALE_INSTALL_DIR "${SHARE_INSTALL_PREFIX}/locale" CACHE PATH "The install dir for translations (default prefix/share/locale)")
set(XDG_APPS_DIR "${SHARE_INSTALL_PREFIX}/applications/" CACHE PATH "The XDG apps dir")
set(XDG_DIRECTORY_DIR "${SHARE_INSTALL_PREFIX}/desktop-directories" CACHE PATH "The XDG directory")
set(SYSCONF_INSTALL_DIR "${EXEC_INSTALL_PREFIX}/etc" CACHE PATH "The ${APPLICATION_NAME} sysconfig install dir (default prefix/etc)")
set(MAN_INSTALL_DIR "${SHARE_INSTALL_PREFIX}/man" CACHE PATH "The ${APPLICATION_NAME} man install dir (default prefix/man)")
set(INFO_INSTALL_DIR "${SHARE_INSTALL_PREFIX}/info" CACHE PATH "The ${APPLICATION_NAME} info install dir (default prefix/info)")
