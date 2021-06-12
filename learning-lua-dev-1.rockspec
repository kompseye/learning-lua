package = "learning-lua"
version = "dev-1"
source = {
   url = "git+https://github.com/kompseye/learning-lua.git"
}
description = {
   summary = "Lua (pronounced LOO-ah) means \"Moon\" in Portugese.",
   detailed = "Lua (pronounced LOO-ah) means \"Moon\" in Portugese. The Lua programming language is a scripting language, dynnamically typed, and runs by interpreting bytecode with a virtual machine. Lua is designed, implemented, and maintained by a team at Pontifical Catholic University of Rio de Janeiro in Brazil, or PUC-Rio.",
   homepage = "https://github.com/kompseye/learning-lua",
   license = "*** please specify a license ***"
}
dependencies = {
   "lua >= 5.0, < 6.0",
   "luacheck >= 0.24.0-2",
   "busted >= 2.0.0-1",
}
build = {
   type = "builtin",
   modules = {
      HelloLua = "src/HelloLua.lua"
   }
}
