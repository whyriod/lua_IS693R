--[[----------------------------------------------------------------------------
    File: hamming.lua
    Summary: Creates a Hamming table with a compute function. Used to get a 
        count of how many gene rows differ between 2 strands.
]]------------------------------------------------------------------------------

local Hamming = {}

--[[----------------------------------------------------------------------------
    Function: Hamming.compute
    Summary: Creates a Hamming table with a compute function. Used to get a 
        count of how many gene rows differ between 2 strands.
    @param a {string} - First DNA strand.
    @param b {string} - Second DNA strand.
    @return {number} - Count of how many sequences differ.
]]------------------------------------------------------------------------------
function Hamming.compute(a,b)

    -- Make sure they are the same length. If they are not, then return -1
    if(#a ~= #b) then
        return -1
    end 
    
    -- Set counter variable
    local count = 0

    -- Go through each table to find difference count
    for i = 1, #a do
        -- sub is inclusive. so sub(1,1) is the first letter
        if a:sub(i,i) ~= b:sub(i,i) then
            count = count + 1
        end
    end

    return count
end

return Hamming
