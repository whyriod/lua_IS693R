--[[----------------------------------------------------------------------------
    File: largest-series-product.lua
    Summary: Exercism Lua Largest Series Product Challenge
]]------------------------------------------------------------------------------

--[[----------------------------------------------------------------------------
    Function: annonymous
    Summary: Returns the largest product for a span of numbers
    @param config {table} - Table with a digit {string} and span {number}
                            element
    @return {number} - The largest product possible
]]------------------------------------------------------------------------------
return function(config)

    -- Reject no digits
    if #config.digits < 1 then
        error()
    -- Reject no span
    elseif config.span < 1 then
        error()
    -- Reject span > digit 
    elseif config.span > #config.digits then
        error()
    -- Reject digits not digits
    elseif config.digits:find("[^0-9]") then
        error()
    end
    -- End Sanity Checks

    local numTable = {}

    -- Get a nice array to be able to work with
    for i = 1, #config.digits do
        numTable[#numTable + 1] = tonumber(config.digits:sub(i,i))
    end

    local product = 0

    -- Calculate max product
    for i = 1, #numTable - (config.span - 1) do
        local p = 1

        for j = i, i + (config.span - 1) do
            p = p * numTable[j]
        end

        -- New biggest number
        if p > product then
            product = p 
        end
    end

    return product
end