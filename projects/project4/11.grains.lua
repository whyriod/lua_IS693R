--[[----------------------------------------------------------------------------
    File: grains.lua
    Summary: Exercism Lua Grains Challenge
]]------------------------------------------------------------------------------

local grains = {}

--[[----------------------------------------------------------------------------
    Function: square
    Summary: Return the number of grains on a given chess square. The first 
             square starts with 1, and then it doubles from there
    @param n {number} - The square number
    @return {number} - The count of rice for said square
]]------------------------------------------------------------------------------
function grains.square(n)
    return 2^(n-1)
end

--[[----------------------------------------------------------------------------
    Function: total
    Summary: Returns the total number of grains on a given chess board. 
    @return {number} - The total number of rice on the chess board.
]]------------------------------------------------------------------------------
function grains.total()
    local total = 0

    -- For each stop, get the number of rice on said square and sum it.
    for i = 1, 64 do
        total = total + grains.square(i)
    end

    return total
end

return grains