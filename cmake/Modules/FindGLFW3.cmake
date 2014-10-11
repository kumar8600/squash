# - Try to find GLFW3 library
# Once done this will define
#
# GLFW3_FOUND
# GLFW3_INCLUDE_DIRS
# GLFW3_LIBRARIES
# GLFW3_DEFINITIONS
#

find_package(PkgConfig)
pkg_check_modules(PC_GLFW3 QUIET glfw3)
set(GLFW3_DEFINITIONS ${PC_GLFW3_CFLAGS_OTHER})

if(CMAKE_CL_64)
  set(PROGRAMFILES $ENV{ProgramW6432})
else()
  set(PROGRAMFILES $ENV{ProgramFiles})
endif()

find_path(GLFW3_INCLUDE_DIR GLFW/glfw3.h
          HINTS ${PC_GLFW3_INCLUDEDIR} ${PC_GLFW3_INCLUDE_DIRS}
          PATHS ${PROGRAMFILES}/GLFW/include)

find_library(GLFW3_LIBRARY NAMES glfw3 glfw
             HINTS ${PC_GLFW3_LIBDIR} ${PC_GLFW3_LIBRARY_DIRS}
             PATHS ${PROGRAMFILES}/GLFW/lib
                   ${PROGRAMFILES}/GLFW/lib-msvc120)

set(GLFW3_LIBRARIES ${GLFW3_LIBRARY} )
set(GLFW3_INCLUDE_DIRS ${GLFW3_INCLUDE_DIR} )

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set GLFW3_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(GLFW3  DEFAULT_MSG
                                  GLFW3_LIBRARY GLFW3_INCLUDE_DIR)

mark_as_advanced(GLFW3_INCLUDE_DIR GLFW3_LIBRARY )
