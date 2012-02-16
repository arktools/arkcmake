# global needed variables
set(APPLICATION_NAME ${PROJECT_NAME})
set(APPLICATION_VERSION "${APPLICATION_VERSION_MAJOR}.${APPLICATION_VERSION_MINOR}.${APPLICATION_VERSION_PATCH}")

# modules
include(DefineCMakeDefaults)
include(DefinePlatformDefaults)
include(DefineCompilerFlags)
include(DefineInstallationPaths)

# add macros
include(ExternalProject)

# settings
option(DEV_MODE "Setup paths for developer testing." OFF)
option(BUILD_SHARED_LIBS "Build shared libraries instead of static." OFF)

if (NOT BUILD_SHARED_LIBS)
    set(BOOST_USE_STATIC_LIBS ON)
    if(WIN32)
        set(CMAKE_FIND_LIBRARY_SUFFIXES .lib .a ${CMAKE_FIND_LIBRARY_SUFFIXES})
    else()
        set(CMAKE_FIND_LIBRARY_SUFFIXES .a ${CMAKE_FIND_LIBRARY_SUFFIXES})
    endif()
endif()

# built variables
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)

# add make dist target
add_custom_target(dist COMMAND ${CMAKE_MAKE_PROGRAM} package_source)

# external projects
if(NOT EP_BASE_DIR)
    set(EP_BASE_DIR "${CMAKE_BINARY_DIR}/CMakeExternals")
endif()
set_property(DIRECTORY PROPERTY EP_BASE ${EP_BASE_DIR})
set(EP_DATADIR ${CMAKE_INSTALL_PREFIX}/share)
set(EP_INCLUDEDIR ${EP_BASE_DIR}/${CMAKE_INSTALL_PREFIX}/include)
set(EP_LIBDIR ${EP_BASE_DIR}/${EP_INSTALL_PREFIX}/lib)
