# About
Enclosed in this repositories are instructions and sample programs aimed to provide a ramp-up to learning the [Lua programming language](https://www.lua.org/about.html).

Lua (pronounced LOO-ah) means "Moon" in Portugese. The Lua programming language is a scripting language, dynnamically typed, and runs by interpreting bytecode with a virtual machine. Lua is designed, implemented, and maintained by a team at Pontifical Catholic University of Rio de Janeiro in Brazil, or PUC-Rio.

# Getting Started
1. Following [these](https://www.lua.org/download.html) instructions. Lua is distributed in source form, so it needs to be built (using make) before it can be used. For Mac OSX, after downloading the source code:
1. run `make macosx test`
1. go into src directory `cd src`
1. run Lua interactively `./lua`
1. type: `print("Hello Lua")`
1. type Control+C to exit

Add Lua to PATH:
1. `export LUA_HOME=/full/path/to/lua/src`
1. `export PATH=$LUA_HOME:$PATH`

Run Lua Program
There is a simple Lua programin this repo. If the above steps have been followed, then run the program as follows:
1. `lua HelloLua.lua`
1. Compile (create bytecode): `luac HelloLua.lua`
1. Run the bytecode: `lua luac.out`

# References
* https://www.lua.org/start.html
* https://www.lua.org/manual/