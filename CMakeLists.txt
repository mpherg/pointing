if(OPTIONAL_CMAKE_ROOT)
  set(CMAKE_ROOT ${OPTIONAL_CMAKE_ROOT})
endif()



project(pointing CXX)
cmake_minimum_required(VERSION 2.8.6)
include_directories("${pointing_SOURCE_DIR}/src")

# Go get Eigen
find_package(Eigen3 REQUIRED)
include_directories(${EIGEN3_INCLUDE_DIR})

# Build pointing library
add_library(pointing STATIC src/pointing.cpp)

# Build Google Mock and Google Test
add_subdirectory(googlemock)
include_directories("${gmock_SOURCE_DIR}/include"
                    "${gtest_SOURCE_DIR}/include")

# Build pointing library unit tests
add_executable(test_pointing src/test/test_pointing.cpp
                             googlemock/src/gmock_main.cc)
target_link_libraries(test_pointing pointing gmock)
