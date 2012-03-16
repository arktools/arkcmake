# - Try to find  ArkHangar
# Once done, this will define
#
#  ARKHANGAR_FOUND        : library found
#  ARKHANGAR_DATADIR      : data directory 
#  ARKHANGAR_VERSION      : version

# macros
include(FindPackageHandleStandardArgs)

# find the data directory
find_path(ARKHANGAR_DATADIR
	NAMES arkhangar/config.h
    PATH_SUFFIXES share
    )

# read the version
if (EXISTS ${_ARKHANGAR_INCLUDE_DIR}/arkcomm/config.h)
    file(READ ${_ARKHANGAR_INCLUDE_DIR}/arkcomm/config.h ARKHANGAR_VERSION_FILE)
    string(REGEX MATCH "#define ARKHANGAR_VERSION[ ]+\"([0-9]\\.[0-9]\\.[0-9])\""
        ARKHANGAR_VERSION_MATCH ${ARKHANGAR_VERSION_FILE})
    set(ARKHANGAR_VERSION ${CMAKE_MATCH_1})
endif()

# handle arguments
find_package_handle_standard_args(ArkHangar
    REQUIRED_VARS ARKHANGAR_DATADIR
    VERSION_VAR ARKHANGAR_VERSION
    )
