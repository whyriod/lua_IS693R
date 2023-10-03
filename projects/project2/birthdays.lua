--[[----------------------------------------------------------------------------
    File: json-sqlite.lua
    Summary: Creates a loop that allows the user to 
		bulk load, insert, update, or delete certain family
		birthday records. 
]]------------------------------------------------------------------------------

local cjson = require("cjson")
local sqlite3 = require("lsqlite3complete")
local DBFILENAME = "birthday.sqlite"
local TABLENAME = "birthday"

--[[----------------------------------------------------------------------------
    Function: createTable
    Summary: Creates database and table (if they dont
		already exist)
]]------------------------------------------------------------------------------
function createTable()
  db = sqlite3.open(DBFILENAME)
  db:exec[=[
	CREATE TABLE IF NOT EXISTS "birthday" (
		"Id"	INTEGER NOT NULL,
		"Name"	TEXT NOT NULL,
		"Birthday"	TEXT NOT NULL,
		PRIMARY KEY("Id" AUTOINCREMENT)
	);
  ]=]
  db:close()
end

--[[----------------------------------------------------------------------------
    Function: selectAll
    Summary: reverses the string and returns it.
    @param s {string} - The string to reverse
    @return {string} - The reversed string
]]------------------------------------------------------------------------------
function showrow(udata, cols, values, names)
  for i=1,cols do print(names[i],values[i]) end
  return 0
end

function selectAll()
  db = sqlite3.open(DBFILENAME)
  db:exec("select * from " .. TABLENAME, showrow)
  db:close()
end

--[[----------------------------------------------------------------------------
    Function: insertBulk
    Summary: reverses the string and returns it.
    @param s {string} - The string to reverse
    @return {string} - The reversed string
]]------------------------------------------------------------------------------

--[[----------------------------------------------------------------------------
    Function: insertRow
    Summary: reverses the string and returns it.
    @param s {string} - The string to reverse
    @return {string} - The reversed string
]]------------------------------------------------------------------------------

--[[----------------------------------------------------------------------------
    Function: deleteRow
    Summary: reverses the string and returns it.
    @param s {string} - The string to reverse
    @return {string} - The reversed string
]]------------------------------------------------------------------------------

--[[----------------------------------------------------------------------------
    Function: updateRow
    Summary: reverses the string and returns it.
    @param s {string} - The string to reverse
    @return {string} - The reversed string
]]------------------------------------------------------------------------------

--[[

local file = assert(io.open(arg[1] ,"r"),"file cannot be found")
local text = file:read("*a")
file:close()

local json = cjson.decode(text)

for i = 1, #json.People, 1 do
	print (json.People[i].Name)
	print(json.People[i].Birthday)
end

]]


function displayOptions() 
	print("Options: ")
	print("1 - Display Birthday Table")
	print("2 - Insert a new person")
	print("3 - Update an existing person")
	print("4 - Delete an existing person")
	print("5 - Display Options")
	print("6 - Exit")
end

function promptInput()
	local o
	repeat 
		print("Please select an option (via option number")
		o = io.read("*number")
	until o >= 1 and o <= 6

	return option(o)
end

function option(o)
	if o == 1 then
		print("Option 1")
	elseif o == 2 then
		print("Option 2")
	elseif o == 3 then
		print("Option 3")
	elseif o == 4 then
		print("Option 4")
	elseif o == 5 then
		displayOptions()
	elseif o == 6 then
		print("Exiting")
		return 0
	else
		error("Something broke")
		return -1
	end
	return promptInput()
end

function game()
	displayOptions()
	promptInput()
end


print("starting")

createTable()
selectAll()
game()