local HelloLua = {}

function HelloLua.hi(name)
  fancy_global_variable.hasProperty = "neat property!"
  fancy_global_variable.hasFunction("neat function!", "second parameter")
  return "Hello " .. name
end

return HelloLua