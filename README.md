# About
Enclosed in this repositories are instructions and sample programs aimed to provide a ramp-up to learning the [Lua programming language](https://www.lua.org/about.html).

Lua (pronounced LOO-ah) means "Moon" in Portugese. The Lua programming language is a scripting language, dynnamically typed, and runs by interpreting bytecode with a virtual machine. Lua is designed, implemented, and maintained by a team at Pontifical Catholic University of Rio de Janeiro in Brazil, or PUC-Rio.

# Prequisite

## Getting Started with LuaRocks
[LuaRocks](https://luarocks.org/) is the package manager for Lua. If you are familiar with Node.js, then LuaRocks would be the "npm" for Lua. [Installing](https://github.com/luarocks/luarocks/wiki/Download) LuaRocks will also install Lua, so you can skip the next Getting Started section. For Mac with Homebrew:
1. `brew update`
1. `brew install luarocks`
1. Verify LuaRocks: `luarocks --version`

## Getting Started with Lua only
1. Following [these](https://www.lua.org/download.html) instructions. Lua is distributed in source form, so it needs to be built (using make) before it can be used. For Mac OSX, after downloading the source code:
1. run `make macosx test`
Add Lua to PATH:
1. `export LUA_HOME=/full/path/to/lua/src`
1. `export PATH=$LUA_HOME:$PATH`

## Verify Lua
1. Verify Lua: `lua -v`
1. run Lua interactively `./lua`
1. type: `print("Hello Lua")`
1. type Control+C to exit

# Run it
There is a simple Lua program in this repo. If the above steps have been followed, then run the program as follows:
1. `lua src/HelloLua.lua`
1. Compile (create bytecode): `luac src/HelloLua.lua`
1. Run the bytecode: `lua luac.out`

# Test it
There are many unit test frameworks for Lua. The most popular, according to LuaRocks downloads, is [Busted](https://olivinelabs.com/busted/). To run, enter command: `luarocks test`

Extra commands:
* Install dependencies: `luarocks build`
* List dependencies `luarocks list`
* Remove dependencies:`luarocks purge --tree lua_modules`

[Luacheck](https://github.com/mpeterv/luacheck) used for linter:
* Run linter: `./lua_modules/bin/luacheck src`

# References
* https://www.lua.org/start.html
* https://www.lua.org/manual/
* https://olivinelabs.com/busted/

# Additional reading
* https://stackoverflow.com/questions/46351239/how-do-i-write-busted-unit-tests-for-functions-that-return-ok-err
* https://stackoverflow.com/questions/44418727/is-it-possible-to-conditionally-load-libraries-in-lua
* https://ericjmritz.wordpress.com/2013/08/26/lua-unit-testing-first-impressions-of-busted/