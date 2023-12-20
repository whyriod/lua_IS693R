--[[----------------------------------------------------------------------------
    File: hello_world.lua
    Summary: Creates a hello_world table, with Your basic hello world function.
]]------------------------------------------------------------------------------

local hello_world = {}

--[[----------------------------------------------------------------------------
    Function: hello_world.hello
    Summary: Creates a hello function on the hello_world table. 
    @return {string} - 'Hello, World!'.
]]------------------------------------------------------------------------------
function hello_world.hello()
  return 'Hello, World!'
end

return hello_world