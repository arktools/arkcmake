# - Try to find  ArkComm
# Once done, this will define
#
#  ARKCOMM_FOUND        : library found
#  ARKCOMM_INCLUDE_DIRS : include directories
#  ARKCOMM_LIBRARIES    : libraries to link to
#  ARKCOMM_DATADIR      : data directory 
#  ARKCOMM_VERSION      : version

# macros
include(FindPackageHandleStandardArgs)

# find the include directory
find_path(_ARKCOMM_INCLUDE_DIR
	NAMES arkcomm/AsyncSerial.hpp
    )

# find the library
find_library(_ARKCOMM_LIBRARY
	NAMES arkcomm
    )

# find the data directory
find_path(ARKCOMM_DATADIR
	NAMES arkcomm/VERSION
    PATH_SUFFIXES share
    )

# read the version
if (EXISTS ${ARKCOMM_DATADIR}/VERSION)
    file(READ ${ARKCOMM_DATADIR}/VERSION ARKCOMM_VERSION)
endif()

# handle arguments
set(ARKCOMM_INCLUDE_DIRS ${_ARKCOMM_INCLUDE_DIR})
set(ARKCOMM_LIBRARIES ${_ARKCOMM_LIBRARY})
find_package_handle_standard_args(ArkComm
    REQUIRED_VARS ARKCOMM_DATADIR ARKCOMM_LIBRARIES ARKCOMM_INCLUDE_DIRS
    VERSION_VAR ARKCOMM_VERSION
    )
