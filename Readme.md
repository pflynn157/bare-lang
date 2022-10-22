## Bare Lang

Welcome to Bare Lang! Bare Lang is a stripped out version of Tiny Lang to give me a starting point for compiler projects with no overhead.

### The Language

The language is very simple. It contains only these structures:
* Functions
* i8, i16, i32, i64 (signed and unsigned), char, string, and bool data types
* Constants
* Arrays (NOTE: Needs to be fixed)
* Structures
* If/elif/else conditional statements
* While loops

And that's all!

Here's a sample of the language:

```
import std.io;

struct S1 is
    x : i32 := 10;
    y : i32 := 20;
end

func main -> i32 is
    struct s : S1;

    var v1 : i32 := s.x;
    s.x := 25;
    
    return 0;
end
```

### The Compiler

The compiler is completely written in C++ and uses only the standard library and LLVM. The lexer, parser, and AST (the frontend) is written from scratch. The backend uses LLVM for simplicity.


### Dependencies

In order to build, you need a C++ compiler, LLVM (most versions should), and minilex.

Minilex is a recent addition to this project. It's my own project, so you can find here on my Github profile. Minilex is a simple lexical analyzer generator. All that's needed is a config file (see src/lex), and a compatible lexical analyzer is generated in the build directory. The source for minilex was originally based on the Tiny Lang lexical analyzer, so needless to say, it works perfectly! :)

For the curious, adding minilex was to make it even easier to fork.

### License

This program is licensed under the BSD-3 License.

