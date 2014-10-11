# - Try to find Bullet physics library
# Once done this will define
#
# BULLET_FOUND
# BULLET_INCLUDE_DIRS
# BULLET_LIBRARIES
# BULLET_DEFINITIONS
#

find_package(PkgConfig)
pkg_check_modules(PC_BULLET QUIET bullet)
set(BULLET_DEFINITIONS ${PC_BULLET_CFLAGS_OTHER})

if(CMAKE_CL_64)
  set(PROGRAMFILES $ENV{ProgramW6432})
else()
  set(PROGRAMFILES $ENV{ProgramFiles})
endif()

find_path(BULLET_INCLUDE_DIR btBulletDynamicsCommon.h
          HINTS ${PC_BULLET_INCLUDEDIR} ${PC_BULLET_INCLUDE_DIRS}
          PATHS ${PROGRAMFILES}/BULLET_PHYSICS/include
          PATH_SUFFIXES bullet)

macro(_FIND_BULLET_LIBRARY _var)
  find_library(${_var}
     NAMES
        ${ARGN}
     HINTS
        ${PC_BULLET_LIBDIR} ${PC_BULLET_LIBRARY_DIRS}
     PATHS
        ${PROGRAMFILES}/BULLET_PHYSICS/lib
     PATH_SUFFIXES lib
  )
  mark_as_advanced(${_var})
endmacro()

_FIND_BULLET_LIBRARY(BULLET_DYNAMICS_LIBRARY        BulletDynamics)
_FIND_BULLET_LIBRARY(BULLET_COLLISION_LIBRARY       BulletCollision)
_FIND_BULLET_LIBRARY(BULLET_MATH_LIBRARY            BulletMath LinearMath)
_FIND_BULLET_LIBRARY(BULLET_SOFTBODY_LIBRARY        BulletSoftBody)

set(BULLET_INCLUDE_DIRS ${BULLET_INCLUDE_DIR} )
set(BULLET_LIBRARIES
        ${BULLET_DYNAMICS_LIBRARY}
        ${BULLET_COLLISION_LIBRARY}
        ${BULLET_MATH_LIBRARY}
        ${BULLET_SOFTBODY_LIBRARY})

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(Bullet DEFAULT_MSG
    BULLET_DYNAMICS_LIBRARY BULLET_COLLISION_LIBRARY BULLET_MATH_LIBRARY
    BULLET_SOFTBODY_LIBRARY BULLET_INCLUDE_DIR)

mark_as_advanced(BULLET_INCLUDE_DIR)
