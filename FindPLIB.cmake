# - Try to find  PLIB
# Once done, this will define
#
#  PLIB_FOUND        : library found
#  PLIB_INCLUDE_DIRS : include directories
#  PLIB_LIBRARIES    : libraries to link to
#  PLIB_VERSION      : version
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

set(_PLIB_EXTRA_SEARCH_PATHS
    /usr/local
    /opt/local
    )

# find the include directory
find_path(_PLIB_INCLUDE_DIR
	NAMES plib/ul.h
    PATHS ${_PLIB_EXTRA_SEARCH_PATHS}
    )

# read the version
if (EXISTS ${_PLIB_INCLUDE_DIR}/ul.h)
    file(READ ${_PLIB_DATADIR}/ul.h PLIB_VERSION_FILE)
    string(REGEX MATCH "^# define PLIB_MAJOR_VERSION.*([0-9])")
    set(_PLIB_MAJOR_VERSION ${CMAKE_MATCH_0})
    string(REGEX MATCH "^# define PLIB_MINOR_VERSION.*([0-9])")
    set(_PLIB_MINOR_VERSION ${CMAKE_MATCH_0})
    string(REGEX MATCH "^# define PLIB_TINY_VERSION.*([0-9])")
    set(_PLIB_TINY_VERSION ${CMAKE_MATCH_0})
    set(PLIB_VERSION "${PLIB_MAJOR_VERSION}.${PLIB_MINOR_VERSION}.${PLIB_TINY_VERSION}")
endif()

# find components
set(PLIB_LIBRARIES "")
if ("${PLIB_FIND_COMPONENTS}" STREQUAL "")
    message(FATAL_ERROR "FindPLIB: must specify a plib library as a component.")
endif()
foreach(component ${PLIB_FIND_COMPONENTS})
    string(TOUPPER ${component} component_uc) 
    string(TOLOWER ${component} component_lc) 
    find_library(PLIB_${component_uc}
        NAMES plib${component_lc} libplib${component_lc}.a
        PATHS ${_PLIB_EXTRA_SEARCH_PATHS}
        )
    list(APPEND PLIB_LIBRARIES ${PLIB_${component_uc}})
endforeach()

# handle arguments
set(PLIB_INCLUDE_DIRS ${_PLIB_INCLUDE_DIR})
find_package_handle_standard_args(PLIB
    REQUIRED_VARS PLIB_LIBRARIES PLIB_INCLUDE_DIRS
    #VERSION_VAR PLIB_VERSION
    )
