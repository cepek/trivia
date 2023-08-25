;;; create-basic-cmake-cxx-project.el --- A trivial C++ projects tool

;; Copyright (C) 2019, 2020  Ales Cepek <cepek@gnu.org>

;; Version: 1.01

;; This package is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This package is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

(defun create-basic-cmake-cxx-project ()
"Create basic cmake C++ project."
(defun project-name()
    (file-name-nondirectory
    (directory-file-name
    (file-name-directory (buffer-file-name)))))
(interactive)
(erase-buffer)
(insert (format
"cmake_minimum_required(VERSION 3.5)

project(%s LANGUAGES CXX VERSION 1.0)

set(CMAKE_CXX_STANDARDS 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


# optional other source code files
set(SOURCES )

if (SOURCES)
  set (LIBRARY ${CMAKE_PROJECT_NAME}-lib)

  add_library(${LIBRARY} OBJECT ${SOURCES})
  add_executable(${CMAKE_PROJECT_NAME} main.cpp $<TARGET_OBJECTS:${LIBRARY}>)

else()
  add_executable(${CMAKE_PROJECT_NAME} main.cpp)

endif()"
(project-name)(project-name)(project-name)(project-name))))
