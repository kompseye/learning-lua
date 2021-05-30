local HelloLua = {}

local x = require "custom_module"

function HelloLua.hi(name)
  x.foo("boo")
  x.boo("foo")
  fancy_global_variable.hasProperty = "neat property!"
  fancy_global_variable.hasFunction("neat function!", "second parameter")
  return "Hello " .. name
end

return HelloLua