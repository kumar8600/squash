# - Try to find OpenGL Mathematics (GLM) library
# Once done this will define
#
# GLM_FOUND
# GLM_INCLUDE_DIRS
# GLM_DEFINITIONS
#

find_package(PkgConfig)
pkg_check_modules(PC_GLM QUIET GLM)
set(GLM_DEFINITIONS ${PC_GLM_CFLAGS_OTHER})

if(CMAKE_CL_64)
  set(PROGRAMFILES $ENV{ProgramW6432})
else()
  set(PROGRAMFILES $ENV{ProgramFiles})
endif()

find_path(GLM_INCLUDE_DIR glm/glm.hpp
          HINTS ${PC_GLM_INCLUDEDIR} ${PC_GLM_INCLUDE_DIRS}
          PATHS ${PROGRAMFILES}/glm/include)

set(GLM_INCLUDE_DIRS ${GLM_INCLUDE_DIR} )

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set GLM_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(GLM  DEFAULT_MSG
                                  GLM_INCLUDE_DIR)

mark_as_advanced(GLM_INCLUDE_DIR)
