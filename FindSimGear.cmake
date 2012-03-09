# - Try to find  SimGear
# Once done, this will define
#
#  SIMGEAR_FOUND        : library found
#  SIMGEAR_INCLUDE_DIRS : include directories
#  SIMGEAR_LIBRARIES    : libraries to link to
#  SIMGEAR_VERSION      : version
#
# when listing components, list in the order below
# to ensure proper static linking
#
# core compoennts:
#        comps
#        environment
#        nasal
#        tsync
#        bucket
#        route
#        io
#        serial
#        math
#        props
#        structure
#        timing
#        xml
#        misc
#        threads
#        debug
#        magvar
#
# scene components:
#        ephem
#        sky
#        material
#        tgdb
#        model
#        screen
#        bvh
#        util
#        sound

# macros
include(FindPackageHandleStandardArgs)

# find the include directory
find_path(_SIMGEAR_INCLUDE_DIR
	NAMES simgear/AsyncSerial.hpp
    )

# find the library
find_library(_SIMGEAR_LIBRARY
	NAMES simgear
    )

# find the data directory
find_path(SIMGEAR_DATADIR
	NAMES simgear/VERSION
    PATH_SUFFIXES share
    )


# read the version
if (EXISTS ${_SIMGEAR_INCLUDE_DIR}/VERSION)
    file(READ ${_SIMGEAR_DATADIR}/VERSION SIMGEAR_VERSION_FILE)
    string(REGEX MATCH "^# define SIMGEAR_VERSION.*([0-9]\.[0-9]\.[0-9])")
    set(SIMGEAR_VERSION ${CMAKE_MATCH_0})
endif()

# find components
set(SIMGEAR_LIBRARIES "")
foreach(component ${SimGear_FIND_COMPONENTS})
    string(TOUPPER ${component} component_uc) 
    string(TOLOWER ${component} component_lc) 
    find_library(SIMGEAR_${component_uc}
        NAMES sg${component_lc}
        PATHS ${SIMGEAR_DIR}
        )
    list(APPEND SIMGEAR_LIBRARIES ${SIMGEAR_${component_uc}})
endforeach()

# handle arguments
set(SIMGEAR_INCLUDE_DIRS ${_SIMGEAR_INCLUDE_DIR})
set(SIMGEAR_LIBRARIES ${_SIMGEAR_LIBRARY})
find_package_handle_standard_args(SimGear
    REQUIRED_VARS SIMGEAR_LIBRARIES SIMGEAR_INCLUDE_DIRS
    VERSION_VAR SIMGEAR_VERSION
    )
