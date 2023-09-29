--[[----------------------------------------------------------------------------
    File: house.lua
    Summary: Creates a house table, with a verse, and recite function. Used to 
        create an old nursery rhyme.
]]------------------------------------------------------------------------------

local house = {}

-- Verse options if not the first line
local verse_old = {
    "that lay in the house that Jack built.",
    "that ate the malt",
    "that killed the rat",
    "that worried the cat",
    "that tossed the dog",
    "that milked the cow with the crumpled horn",
    "that kissed the maiden all forlorn",
    "that married the man all tattered and torn",
    "that woke the priest all shaven and shorn",
    "that kept the rooster that crowed in the morn",
    "that belonged to the farmer sowing his corn",
}

-- Verse options if the first line
local verse_new = {
    "This is the house that Jack built.",
    "This is the malt",
    "This is the rat",
    "This is the cat",
    "This is the dog",
    "This is the cow with the crumpled horn",
    "This is the maiden all forlorn",
    "This is the man all tattered and torn",
    "This is the priest all shaven and shorn",
    "This is the rooster that crowed in the morn",
    "This is the farmer sowing his corn",
    "This is the horse and the hound and the horn"
}

--[[----------------------------------------------------------------------------
    Function: house.verse
    Summary: Receive a number. Use this to build the verse by taking the first
        line, and then concatenating the other lines onto it. 
    @param which {number} - Which verse to create.
    @return {string} - The verse as a string.
]]------------------------------------------------------------------------------
house.verse = function(which)
    -- Start string builder with the verse selected
    local stringBuilder = verse_new[which]

    -- If there are additional verses to add, tack them on.
    for i = which - 1, 1, -1 do
        stringBuilder = stringBuilder .. "\n" .. verse_old[i]
    end

    return stringBuilder
end

--[[----------------------------------------------------------------------------
    Function: house.recite
    Summary: Create all verses for the nursery rhyme.
    @param which {number} - Which verse to create.
    @return {string} - The verse as a string.
]]------------------------------------------------------------------------------
house.recite = function()
    -- Start string builder with the first verse.
    local stringBuilder = house.verse(1)

    -- Tack on all additional verses.
    for i = 2, #verse_new, 1 do
        stringBuilder = stringBuilder .. "\n" .. house.verse(i)
    end

    return stringBuilder
end

return house
