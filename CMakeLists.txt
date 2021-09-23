cmake_minimum_required (VERSION 3.5)

project(repo4
    VERSION 1.0
)



message("CMAKE_PROJECT_NAME: ${CMAKE_PROJECT_NAME}")
message("CMAKE_SOURCE_DIR: ${CMAKE_SOURCE_DIR}")
message("CMAKE_BINARY_DIR: ${CMAKE_BINARY_DIR}")

message("PROJECT_NAME: ${PROJECT_NAME}")
message("PROJECT_SOURCE_DIR: ${PROJECT_SOURCE_DIR}")
message("PROJECT_BINARY_DIR: ${PROJECT_BINARY_DIR}")

message("CMAKE_CURRENT_SOURCE_DIR: ${CMAKE_CURRENT_SOURCE_DIR}")
message("CMAKE_CURRENT_BINARY_DIR: ${CMAKE_CURRENT_BINARY_DIR}")
message("CMAKE_CURRENT_LIST_DIR: ${CMAKE_CURRENT_LIST_DIR}")

message("CMAKE_PREFIX_PATH: ${CMAKE_PREFIX_PATH}")
message("CMAKE_MODULE_PATH: ${CMAKE_MODULE_PATH}")
message("CMAKE_TOOLCHAIN_FILE: ${CMAKE_TOOLCHAIN_FILE}")





#configurations





# dependencies

find_package(Repo3 REQUIRED)

if (NOT TARGET Repo3::library3)
  message("not find Repo3::library3")
endif ()




# targets and directories
add_subdirectory(library4)
add_subdirectory(binary4)






# export and install


# set(CMAKE_INSTALL_INCLUDEDIR include)
# set(CMAKE_INSTALL_LIBDIR lib)
# set(install_cmakedir ${CMAKE_INSTALL_LIBDIR}/cmake/repo3)


install(
    TARGETS
        library4
    EXPORT repo4-export
    LIBRARY DESTINATION lib/repo4
    ARCHIVE DESTINATION lib/repo4
)



install(
    EXPORT repo4-export
    FILE Repo4Targets.cmake
    NAMESPACE Repo4::
    DESTINATION lib/cmake/repo4
)

export(
    EXPORT repo4-export
    FILE ${CMAKE_CURRENT_BINARY_DIR}/Repo4Targets.cmake
    NAMESPACE Repo4::
)

# export(PACKAGE Repo3)




include(CMakePackageConfigHelpers)

configure_package_config_file(
    ${CMAKE_CURRENT_LIST_DIR}/Repo4Config.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/Repo4Config.cmake
    INSTALL_DESTINATION lib/cmake/repo4
)

# the config.cmake here is not suitable for installation
install(
  FILES ${CMAKE_CURRENT_BINARY_DIR}/Repo4Config.cmake
  DESTINATION lib/cmake/repo4
)

write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/Repo4ConfigVersion.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY ExactVersion
)

install(
  FILES ${CMAKE_CURRENT_BINARY_DIR}/Repo4ConfigVersion.cmake
  DESTINATION "lib/cmake/repo4"
)


install(
  FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/library4/public/library4.h
  DESTINATION "include/repo4/library4/public"
)
