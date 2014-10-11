# - Try to find entityx library
# Once done this will define
#
# ENTITYX_FOUND
# ENTITYX_INCLUDE_DIRS
# ENTITYX_LIBRARIES
# ENTITYX_DEFINITIONS
#

find_package(PkgConfig)
pkg_check_modules(PC_ENTITYX QUIET ENTITYX)
set(ENTITYX_DEFINITIONS ${PC_ENTITYX_CFLAGS_OTHER})

if(CMAKE_CL_64)
  set(PROGRAMFILES $ENV{ProgramW6432})
else()
  set(PROGRAMFILES $ENV{ProgramFiles})
endif()

find_path(ENTITYX_INCLUDE_DIR entityx/entityx.h
          HINTS ${PC_ENTITYX_INCLUDEDIR} ${PC_ENTITYX_INCLUDE_DIRS}
          PATHS ${PROGRAMFILES}/entityx/include)

find_library(ENTITYX_LIBRARY entityx
             HINTS ${PC_ENTITYX_LIBDIR} ${PC_ENTITYX_LIBRARY_DIRS}
             PATHS ${PROGRAMFILES}/entityx/lib)

set(ENTITYX_LIBRARIES ${ENTITYX_LIBRARY} )
set(ENTITYX_INCLUDE_DIRS ${ENTITYX_INCLUDE_DIR} )

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set ENTITYX_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(ENTITYX  DEFAULT_MSG
                                  ENTITYX_LIBRARY ENTITYX_INCLUDE_DIR)

mark_as_advanced(ENTITYX_INCLUDE_DIR ENTITYX_LIBRARY )
