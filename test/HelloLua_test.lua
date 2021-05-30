describe("HelloLua", function()

  -- HelloLua has a module that is imported.
  -- ./src/HelloLua.lua:3: module 'custom-module' not found
  -- There are three insulate blocks below. Insulation is necessary to isolate the tests.  
  -- After faking out the module with package.loaded, then Stubs, Spies, and Hook Stubs are demonstrated.
  -- package.loaded works because the module is loaded once here in the unit test and used again in the module under test
  -- https://stackoverflow.com/questions/48409979/mocking-local-imports-when-unit-testing-lua-code-with-busted  

  insulate("Demo Stubs", function()
    -- Stubs
    --   * fake out the custom module with package.loaded
    --   * stub the functions
    --   * in the test case, assert the stub was called with expected parameters
    local custom_module = require "fake.custom_module"
    package.loaded["custom_module"] = require "fake.custom_module"
    stub(custom_module, "foo")
    stub(custom_module, "boo")

    -- stub the global variable in the module under test
    -- without the stub, this is the error: 
    -- ./src/HelloLua.lua:4: attempt to index a nil value (global 'fancy_global_variable')  
    _G.fancy_global_variable = {
      hasProperty,
      hasFunction
    }

    it("says hello", function()
      -- setup
      local hello_lua = require "HelloLua"
      local hasFunctionSpy = spy.on(_G.fancy_global_variable, "hasFunction")

      -- functionality under test
      local greeting = hello_lua.hi("Sam")

      -- validate
      assert.is_not_nil(greeting)
      assert.is_equal("Hello Sam", greeting, "The generated greeting is not correct") 
      assert.stub(custom_module.foo, "custom_module.foo was not called with the expected parameters").was.called_with('boo')     
      assert.spy(hasFunctionSpy).was.called()
      assert.spy(hasFunctionSpy).was.called_with("neat function!", "second parameter")
    end)
  end)

  insulate("Demo Spies", function()

    -- Spies
    --   * require the fake module locally to spy on the functions
    --   * fake out the custom module with package.loaded
    local custom_module = require "fake.custom_module"
    package.loaded["custom_module"] = custom_module
    
    -- stub the global variable in the module under test
    -- without the stub, this is the error: 
    -- ./src/HelloLua.lua:4: attempt to index a nil value (global 'fancy_global_variable')  
    _G.fancy_global_variable = {
      hasProperty,
      hasFunction
    }

    it("says hello", function()
      -- setup
      local hello_lua = require "HelloLua"
      local hasFunctionSpy = spy.on(_G.fancy_global_variable, "hasFunction")
      --local customModuleFooSpy = spy.on(custom_module, "foo")

      -- functionality under test
      local greeting = hello_lua.hi("Sam")

      -- validate
      assert.is_not_nil(greeting)
      assert.is_equal("Hello Sam", greeting, "The generated greeting is not correct")
      --assert.spy(customModuleFooSpy).was.called()
      --assert.spy(customModuleFooSpy).was.called_with("boo")
      assert.spy(hasFunctionSpy).was.called()
      assert.spy(hasFunctionSpy).was.called_with("neat function!", "second parameter")
    end)
  end)

  insulate("Demo Hook Stubs", function()

    -- Hook Stubs
    --   * require the fake module
    --   * define "hook stub" (seems similar to proxyquire)
    --   * use setmetatable to intercept the call to the module
    -- https://stackoverflow.com/questions/44424819/unit-testing-local-function-in-lua
    local custom_module = require "fake.custom_module"
    local function hook_func(_, key)
      print('Accessing "custom_module" attribute '..tostring(key))
      
      -- intercept -- what to do here?
      -- return a stub?

      return custom_module[key]
    end
    package.loaded["custom_module"] = setmetatable({}, {__index = hook_func})
    
    -- stub the global variable in the module under test
    -- without the stub, this is the error: 
    -- ./src/HelloLua.lua:4: attempt to index a nil value (global 'fancy_global_variable')  
    _G.fancy_global_variable = {
      hasProperty,
      hasFunction
    }

    it("says hello", function()
      -- setup
      local hello_lua = require "HelloLua"
      local hasFunctionSpy = spy.on(_G.fancy_global_variable, "hasFunction")

      -- functionality under test
      local greeting = hello_lua.hi("Sam")

      -- validate
      assert.is_not_nil(greeting)
      assert.is_equal("Hello Sam", greeting, "The generated greeting is not correct")
      assert.spy(hasFunctionSpy).was.called()
      assert.spy(hasFunctionSpy).was.called_with("neat function!", "second parameter")
    end)
  end)

end)