# - Try to find  ARKOSG
# Once done, this will define
#
#  ARKOSG_FOUND - system has scicoslab 
#  ARKOSG_INCLUDE_DIRS - the scicoslab include directories
#  ARKOSG_LIBRARIES - libraries to link to

include(LibFindMacros)
include(MacroCommonPaths)

MacroCommonPaths(ARKOSG)

# Include dir
find_path(ARKOSG_INCLUDE_DIR
	NAMES arkosg/osgUtils.hpp
	PATHS ${COMMON_INCLUDE_PATHS_ARKOSG}
)

# data dir
find_path(ARKOSG_DATA_DIR_SEARCH
	NAMES arkosg/data/models/plane.ac
	PATHS ${COMMON_DATA_PATHS_ARKOSG}
)
set(ARKOSG_DATA_DIR ${ARKOSG_DATA_DIR_SEARCH}/arkosg/data)

# the library itself
find_library(ARKOSG_LIBRARY
	NAMES arkosg
	PATHS ${COMMON_LIBRARY_PATHS_ARKOSG}
)

# the import file
find_path(ARKOSG_LIBRARY_DIR
	NAMES arkosg/arkosg-targets.cmake
	PATHS ${COMMON_LIBRARY_PATHS_ARKOSG}
)
set(ARKOSG_LIB_IMPORT ${ARKOSG_LIBRARY_DIR}/arkosg/arkosg-targets.cmake)

# Set the include dir variables and the libraries and let libfind_process do the rest.
# NOTE: Singular variables for this library, plural for libraries this this lib depends on.
set(ARKOSG_PROCESS_INCLUDES ARKOSG_INCLUDE_DIR)
set(ARKOSG_PROCESS_LIBS ARKOSG_LIBRARY ARKOSG_LIBRARIES)
libfind_process(ARKOSG)

macro(build_arkosg TAG EP_BASE_DIR EP_DATADIR)
    if(NOT ARKOSG_FOUND)
        ExternalProject_Add(arkosg
            GIT_REPOSITORY "git://github.com/arktools/arkosg.git"
            GIT_TAG ${TAG}
            UPDATE_COMMAND ""
            INSTALL_DIR ${EP_BASE_DIR}/${CMAKE_INSTALL_PREFIX}
            CMAKE_ARGS
                -DEP_BASE_DIR=${EP_BASE_DIR}
                -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
                -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
            INSTALL_COMMAND make DESTDIR=${EP_BASE_DIR} install
           )
        set(ARKOSG_INCLUDE_DIRS ${EP_BASE_DIR}/${CMAKE_INSTALL_PREFIX}/include)
        set(ARKOSG_DATA_DIR ${EP_DATADIR}/arkosg/data)
        set(ARKOSG_LIBRARIES ${EP_BASE_DIR}/${CMAKE_INSTALL_PREFIX}/lib/libarkosg.a)
        set(ARKOSG_FOUND TRUE)
    endif()
endmacro()
