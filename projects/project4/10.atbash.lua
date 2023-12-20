--[[----------------------------------------------------------------------------
    File: atbash.lua
    Summary: Exercism Lua Atbash Cipher Challenge
]]------------------------------------------------------------------------------

--[[----------------------------------------------------------------------------
    Function: encode
    Summary: Recieves a string to encode as an atbash cipher.
    @param plaintext {string} - The string to reverse with the atbash cipher
    @return {string} - The string fliped with the atbash cipher
]]------------------------------------------------------------------------------
return {
    encode = function(plaintext)
        -- Easy table to index into for cipher
        encodeTable = {
            ['a']='z',
            ['b']='y',
            ['c']='x',
            ['d']='w',
            ['e']='v',
            ['f']='u',
            ['g']='t',
            ['h']='s',
            ['i']='r',
            ['j']='q',
            ['k']='p',
            ['l']='o',
            ['m']='n',
            ['n']='m',
            ['o']='l',
            ['p']='k',
            ['q']='j',
            ['r']='i',
            ['s']='h',
            ['t']='g',
            ['u']='f',
            ['v']='e',
            ['w']='d',
            ['x']='c',
            ['y']='b',
            ['z']='a'
        }
    
        decoded = {}
    
        -- Clean string
        plaintext = plaintext:lower()
        plaintext = plaintext:gsub("[^0-9a-z]","")
    
        for i = 1, #plaintext do
            local character = plaintext:sub(i,i)
            -- Can it be converted?
            if(character:find("[a-z]")) then
                decoded[#decoded + 1] = encodeTable[character]
            -- Its something else
            else 
                decoded[#decoded + 1] = character
                i = i - 1
            end 
    
            -- Need an extra space
            if i % 5 == 0 and i ~= #plaintext then
                decoded[#decoded + 1] = " "
            end
        end

        return table.concat(decoded)
    end
}