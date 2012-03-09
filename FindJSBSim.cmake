# - Try to find  JSBSim
# Once done, this will define
#
#  JSBSIM_FOUND        : library found
#  JSBSIM_INCLUDE_DIRS : include directories
#  JSBSIM_LIBRARIES    : libraries to link to
#  JSBSIM_DATADIR      : data directory 
#  JSBSIM_VERSION      : version

# macros
include(FindPackageHandleStandardArgs)

# find the include directory
find_path(_JSBSIM_INCLUDE_DIR
	NAMES jsbsim/initialization/FGTrimmer.h
    )

# find the library
find_library(_JSBSIM_LIBRARY
	NAMES jsbsim
    )

# find the data directory
find_path(JSBSIM_DATADIR
	NAMES jsbsim/VERSION
    PATH_SUFFIXES share
    )

# read the version
if (EXISTS ${JSBSIM_DATADIR}/VERSION)
    file(READ ${JSBSIM_DATADIR}/VERSION JSBSIM_VERSION)
endif()

# handle arguments
set(JSBSIM_INCLUDE_DIRS ${_JSBSIM_INCLUDE_DIR})
set(JSBSIM_LIBRARIES ${_JSBSIM_LIBRARY})
find_package_handle_standard_args(JSBSim
    REQUIRED_VARS JSBSIM_DATADIR JSBSIM_LIBRARIES JSBSIM_INCLUDE_DIRS
    VERSION_VAR JSBSIM_VERSION
    )
