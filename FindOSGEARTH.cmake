# - Try to find  OSGEARTH
# Once done, this will define
#
#  OSGEARTH_FOUND - system has scicoslab 
#  OSGEARTH_INCLUDE_DIRS - the scicoslab include directories
#  OSGEARTH_LIBRARIES - libraries to link to

include(LibFindMacros)
include(MacroCommonPaths)

MacroCommonPaths(OSGEARTH)

# Include dir
find_path(OSGEARTH_INCLUDE_DIR
    NAMES osgearth/header.h
    PATHS ${COMMON_INCLUDE_PATHS_OSGEARTH}
)

# data dir
find_path(OSGEARTH_DATA_DIR_SEARCH
    NAMES osgearth/data/file.dat
    PATHS ${COMMON_DATA_PATHS_OSGEARTH}
)
set(OSGEARTH_DATA_DIR ${OSGEARTH_DATA_DIR_SEARCH}/jsbsim)

# Finally the library itself
find_library(OSGEARTH_LIBRARY
    NAMES osgearth
    PATHS ${COMMON_LIBRARY_PATHS_OSGEARTH}
)

# Set the include dir variables and the libraries and let libfind_process do the rest.
# NOTE: Singular variables for this library, plural for libraries this this lib depends on.
set(OSGEARTH_PROCESS_INCLUDES OSGEARTH_INCLUDE_DIR)
set(OSGEARTH_PROCESS_LIBS OSGEARTH_LIBRARY OSGEARTH_LIBRARIES)
set(OSGEARTH_INCLUDE_DIR ${OSGEARTH_INCLUDE_DIR})
set(OSGEARTH_INCLUDES ${OSGEARTH_INCLUDES})

libfind_process(OSGEARTH)
