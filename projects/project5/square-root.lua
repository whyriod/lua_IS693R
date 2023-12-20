--[[----------------------------------------------------------------------------
    File: square-root.lua
    Summary: Exercism Lua Square Root Challenge
]]------------------------------------------------------------------------------

--[[----------------------------------------------------------------------------
    Function: square_root
    Summary: Returns the square root of a number
    @param radicand {number} - Parameter to get the square root of
    @return {number} - The square root
]]------------------------------------------------------------------------------
local SquareRoot = {}

function SquareRoot.square_root(radicand)
    return radicand^0.5
end

return SquareRoot
