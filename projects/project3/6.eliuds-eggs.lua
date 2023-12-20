--[[----------------------------------------------------------------------------
    File: eliuds-eggs.lua
    Summary: Performs the Exercism Eliud's Eggs challenge
]]------------------------------------------------------------------------------

--[[----------------------------------------------------------------------------
    Function: PopCount.eqq_count
    Summary: reverses the string and returns it.
    @param number {number} - Mods the binary string. If there is an odd number,
                             that indicates the existance of an egg.
    @return {number} - The egg count
]]------------------------------------------------------------------------------
local PopCount = {}

function PopCount.egg_count(number)
    eggs = 0
    while number > 0 do
        if number % 2 ~= 0 then
            eggs = eggs + 1
        end
        number = math.floor(number/2)
    end
    return eggs
end

return PopCount