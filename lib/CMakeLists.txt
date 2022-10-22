cmake_minimum_required(VERSION 3.0.0)
project(barelang_lib)

enable_language(ASM)

set(SRC
    test.s
)

add_library(barelang STATIC ${SRC})
