--[[----------------------------------------------------------------------------
    File: binary.lua
    Summary: Exercism Lua Binary Challenge
]]------------------------------------------------------------------------------

--[[----------------------------------------------------------------------------
    Function: to_decimal
    Summary: Returns the decimal form of a binary number
    @param {string} - The string binary number to convert
    @return {number} - The decimal number
]]------------------------------------------------------------------------------
local function to_decimal(binary)

    -- Make sure its a number
    if(binary:find('[^0-9]')) then
        return 0
    end 
    
    local binaryTable = {}
    local decimal = 0

    -- Iterate over each number and put it into a table as a number.
    for n in binary:gmatch('%d') do
        binaryTable[#binaryTable + 1] = tonumber(n)
    end

    local increment = 1

    for i = #binaryTable, 1, -1 do 
        decimal = decimal + binaryTable[i] * increment
        increment = increment * 2
    end

    return decimal
end

return {
  to_decimal = to_decimal
}

