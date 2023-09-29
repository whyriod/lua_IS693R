--[[----------------------------------------------------------------------------
    File: difference-of-squares.lua
    Summary: Creates 3 functions, and returns them. One for sum of squares,
        one for square of sum, and one for the difference.
]]------------------------------------------------------------------------------


--[[----------------------------------------------------------------------------
    Function: square_of_sum
    Summary: Sums numbers 1...n and then squares the sum.
    @param n {number} - 1...n numbers to sum.
    @return {number} - The square_of_sum.
]]------------------------------------------------------------------------------
local function square_of_sum(n)
    local sum = 0
    for i = 1, n, 1 do
        sum = sum + i
    end 
    return sum * sum
end

--[[----------------------------------------------------------------------------
    Function: sum_of_squares
    Summary: Squares numbers 1...n and then sums them.
    @param n {nnumber} - 1...n numbers to square then sum.
    @return {number} - The sum_of_squares.
]]------------------------------------------------------------------------------
local function sum_of_squares(n)
    sum = 0
    for i = 1, n, 1 do
        sum = sum + (i * i)
    end 
    return sum  
end

--[[----------------------------------------------------------------------------
    Function: difference_of_squares
    Summary: Calculate the difference between the square_of_sum and the
        sum_of_square
    @param n {nnumber} - 1...n numbers to calculate the square_of_sum and the
        sum_of_square for.
    @return {number} - The difference between the square_of_sum and 
        sum_of_square.
]]------------------------------------------------------------------------------
local function difference_of_squares(n)
    return square_of_sum(n) - sum_of_squares(n)
end

-- Return for caller use.
return {
  square_of_sum = square_of_sum,
  sum_of_squares = sum_of_squares,
  difference_of_squares = difference_of_squares
}