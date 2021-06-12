-- fake out the local import
-- following pattern:
-- https://stackoverflow.com/questions/48409979/mocking-local-imports-when-unit-testing-lua-code-with-busted

local custom_module = {}

-- add a signature for each function
function custom_module.foo(name) return "fake custom_module.foo" end
function custom_module.boo(name) return "fake custom_module.boo" end

return custom_module