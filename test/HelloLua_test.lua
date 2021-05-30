describe("HelloLua", function()

  -- stub the global variable in the  module under test
  -- without the stub, this is the error: 
  -- ./src/HelloLua.lua:4: attempt to index a nil value (global 'fancy_global_variable')
  _G.fancy_global_variable = {
    hasProperty = "",
    hasFunction = function(input)
      return true
    end    
  }

  it("says hello", function()
    -- setup
    local hello_lua = require "HelloLua"
    local s = spy.on(_G.fancy_global_variable, "hasFunction")

    -- functionality under test
    local greeting = hello_lua.hi("Sam")

    -- validate
    assert.is_not_nil(greeting)
    assert.is_equal("Hello Sam", greeting, "The generated greeting is not correct")
    assert.spy(s).was.called()
    assert.spy(s).was.called_with("neat function!", "second parameter")  
  end)
  
end)