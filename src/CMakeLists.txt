cmake_minimum_required(VERSION 3.0.0)
project(tl_frontend)

add_custom_command(
    OUTPUT ${CMAKE_BINARY_DIR}/src/lex.cpp
           ${CMAKE_BINARY_DIR}/src/lex.hpp
           ${CMAKE_BINARY_DIR}/src/lex_debug.cpp
    COMMAND minilex ${CMAKE_SOURCE_DIR}/src/lex/lex
    DEPENDS ${CMAKE_SOURCE_DIR}/src/lex/lex.py
)
include_directories(${CMAKE_BINARY_DIR}/src)

set(LLVM_COMPILER_SRC
    compiler/llvm/Builder.cpp
    compiler/llvm/Compiler.cpp
    compiler/llvm/Flow.cpp
    compiler/llvm/Function.cpp
    compiler/llvm/Variable.cpp
)

set(SRC
    # Frontend sources
    ${CMAKE_BINARY_DIR}/src/lex.cpp
    ${CMAKE_BINARY_DIR}/src/lex_debug.cpp
    
    ast/ast_builder.cpp
    ast/astdot.cpp
    
    debug/AstDebug.cpp
    
    parser/ErrorManager.cpp
    parser/Expression.cpp
    parser/Flow.cpp
    parser/Function.cpp
    parser/Parser.cpp
    parser/Structure.cpp
    parser/Variable.cpp
    
    preproc/Preproc.cpp
    
    # Compile sources
    ${LLVM_COMPILER_SRC}
)

add_executable(blc ${SRC} main.cpp)

llvm_map_components_to_libnames(llvm_libs support core irreader target asmparser
    X86AsmParser
    X86CodeGen
    X86Info
)

target_link_libraries(blc
    ${llvm_libs}
)

