# global needed variables
set(APPLICATION_NAME ${PROJECT_NAME})
set(APPLICATION_VERSION "${APPLICATION_VERSION_MAJOR}.${APPLICATION_VERSION_MINOR}.${APPLICATION_VERSION_PATCH}")

# modules
include(DefineCMakeDefaults)
include(DefinePlatformDefaults)
include(DefineCompilerFlags)
include(DefineInstallationPaths)

# disallow in-source build
include(MacroEnsureOutOfSourceBuild)
macro_ensure_out_of_source_build("${PROJECT_NAME} requires an out of source build. 
Please create a separate build directory and run 'cmake /path/to/${PROJECT_NAME} [options]' there.")

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

# set build type
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE RelWithDebInfo CACHE STRING
      "Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel."
      FORCE)
endif(NOT CMAKE_BUILD_TYPE)

# add make dist target
add_custom_target(dist COMMAND ${CMAKE_MAKE_PROGRAM} package_source)

# external projects
if(NOT EP_BASE_DIR)
    set(EP_BASE_DIR "${CMAKE_BINARY_DIR}/CMakeExternals")
endif()
if(NOT EP_INSTALL_PREFIX)
    set(EP_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX})
endif()
set_property(DIRECTORY PROPERTY EP_BASE ${EP_BASE_DIR})

# install/developer mode
if(DEV_MODE)
    message(STATUS "configuring for in source build")
    set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/install)
    if (NOT DATA_INSTALL_DIR)
        set(DATA_INSTALL_DIR ${PROJECT_SOURCE_DIR}/data)
    endif()
    if (NOT LIB_INSTALL_DIR)
        set(LIB_INSTALL_DIR ${CMAKE_BINARY_DIR}/lib)
    endif()
    if (NOT  
    set(${PROJECT_NAME}_LIBDIR ${CMAKE_BINARY_DIR}/lib)
    set(${PROJECT_NAME}_BINDIR ${CMAKE_BINARY_DIR}/bin)
    set(EP_DATADIR ${EP_BASE_DIR}/${EP_INSTALL_PREFIX}/share)
else()
    message(STATUS "configuring for install build")
    set(${PROJECT_NAME}_DATADIR ${CMAKE_INSTALL_PREFIX}/share/${PROJECT_NAME}/data)
    set(${PROJECT_NAME}_LIBDIR ${CMAKE_INSTALL_PREFIX}/lib)
    set(${PROJECT_NAME}_BINDIR ${CMAKE_INSTALL_PREFIX}/bin)
    set(EP_DATADIR ${EP_INSTALL_PREFIX}/share)
endif()
set(EP_INCLUDEDIR ${EP_BASE_DIR}/${EP_INSTALL_PREFIX}/include)
set(EP_LIBDIR ${EP_BASE_DIR}/${EP_INSTALL_PREFIX}/lib)
