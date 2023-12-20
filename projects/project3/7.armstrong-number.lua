--[[----------------------------------------------------------------------------
    File: armstrong-number.lua
    Summary: Performs the Exercism Armstrong-number challenge
]]------------------------------------------------------------------------------

--[[----------------------------------------------------------------------------
    Function: ArmstrongNumbers.is_armstrong_number
    Summary: Takes in a number, splits apart its digits, and then sums the
             result of puting them to the power of the number of digits in the
             number. If the sum equals the number passed in, then it is an 
             Armstrong number.
    @param number {number} - The number to check if it is an armstrong number
    @return {boolean} - If the number is an Armstrong number or not.
]]------------------------------------------------------------------------------
local ArmstrongNumbers = {}

function ArmstrongNumbers.is_armstrong_number(number)

    -- Convert the number to a string to get digits.
    local str = tostring(number)
    local numTable = {}
    local sum = 0


    -- Create a table to loop through to get each digit as a number.
    for n in str:gmatch('%d') do
        numTable[#numTable+1] = tonumber(n)
    end

    -- Find the sum of what the numbers are. 
    for i = 1, #numTable do
        sum = sum + numTable[i]^#numTable
    end

    return number == sum
end

return ArmstrongNumbers

