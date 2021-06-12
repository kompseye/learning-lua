local HelloLua = {}

local custom_module = require "custom_module"

function HelloLua.hi(name)
  if custom_module.foo("boo") then
    print(custom_module.foo("boo"))
  else
    print("Cannot print custom_module.foo")
  end
  if custom_module.boo("foo") then
    print(custom_module.boo("foo"))
  else
    print("Cannot print custom_module.boo")
  end

  fancy_global_variable.hasProperty = "neat property!"
  fancy_global_variable.hasFunction("neat function!", "second parameter")
  return "Hello " .. name
end

return HelloLua