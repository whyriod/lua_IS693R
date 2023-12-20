--[[----------------------------------------------------------------------------
    File: json-sqlite.lua
    Summary: A system for inserting, updating, or 
		deleteing family member records, consisting of a 
		name and birthday from a sqlite database.
]]------------------------------------------------------------------------------

-- Docs: https://github.com/openresty/lua-cjson
local cjson = require("cjson")
-- Docs: http://lua.sqlite.org/index.cgi/doc/tip/doc/lsqlite3.wiki
local sqlite3 = require("lsqlite3complete")

-- Constants
local DBFILENAME = "birthday.sqlite"
local TABLENAME = "birthday"

--[[----------------------------------------------------------------------------
    Function: createTable
    Summary: Creates database and table (if they dont
		already exist)
]]------------------------------------------------------------------------------
function createTable()
  local db = sqlite3.open(DBFILENAME)
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
    Summary: Select all database records from 
		TABLENAME and display them to the screen.
		This occurs via callback function showrow, which
		is called for each row returned.
]]------------------------------------------------------------------------------
function selectAll()
  local db = sqlite3.open(DBFILENAME)
  db:exec("select * from " .. TABLENAME, showrow)
  db:close()
end


--[[----------------------------------------------------------------------------
    Function: showrow
    Summary: For eah of the columns, print out the name
		of the column along with its values. 
    @param udata {??} - The string to reverse
	@param cols {table} - Table of columns
	@param values {table} - Table of values
	@param names {table} - Table of names for columns
    @return {number} - 0 is success.
]]------------------------------------------------------------------------------
function showrow(udata, cols, values, names)
  for i=1,cols do print(names[i],values[i]) end
  return 0
end


--[[----------------------------------------------------------------------------
    Function: bulkUpdate
    Summary: Requests a file name from the user. Pulls
		it in and then decodes the json into a table. Said
		table is then parsed into insert statements, and
		put into the database. 
]]------------------------------------------------------------------------------\
function bulkUpdate()

	local fileName = promptLine("Please enter the file name")
	local file = assert(io.open(fileName,"r"),"file cannot be found")
	local text = file:read("*a")
	file:close()
	
	local json = cjson.decode(text)
	
	local db = sqlite3.open(DBFILENAME)
	for i = 1, #json.People, 1 do
	    db:exec("Insert into " .. TABLENAME .. " (Name, Birthday)" ..
		" Values ('" .. json.People[i].Name .. "', '" ..
		json.People[i].Birthday .. "')")
		--print(db:errmsg())
	end
	db:close()
end

--[[----------------------------------------------------------------------------
    Function: insertRow
    Summary: reverses the string and returns it.
    @param s {string} - The string to reverse
    @return {string} - The reversed string
]]------------------------------------------------------------------------------
function insertRow()
	local name = tonumber(promptLine("Please enter the name of the person"))
	local birthday = tonumber(promptLine("Please enter the birthday of the person"))
	
	local db = sqlite3.open(DBFILENAME)
	db:exec("Insert into " .. TABLENAME .. " (Name, Birthday)" ..
	" Values ('" .. name .. "', '" .. birthday .. "')")
	db:close()
end


--[[----------------------------------------------------------------------------
    Function: updateRow
    Summary: 
    @param s {} - 
    @return {} - 
]]------------------------------------------------------------------------------		

--[[----------------------------------------------------------------------------
    Function: deleteRow
    Summary: Requests row id to delete. Then deletes
		the row.
]]------------------------------------------------------------------------------
function deleteRow()
	local deleteId = tonumber(promptLine("Please enter the row id to delete"))
	
	local db = sqlite3.open(DBFILENAME)
	db:exec("Delete from " .. TABLENAME ..
	" where id = " .. deleteId)
	db:close()
end



function displayOptions() 
	print("Options: ")
	print("1 - Display Birthday Table")
	print("2 - Bulk insert persons")
	print("3 - Insert a new person")
	print("4 - Update an existing person")
	print("5 - Delete an existing person")
	print("6 - Display Options")
	print("7 - Exit")
end

function promptLine(text)
	local o
	print(text)
	o = io.read()
	return o
end

function promptOption()
	local o
	repeat 
		print("Please select an option (via option number)")
		o = tonumber(io.read())
	until o >= 1 and o <= 6
	return option(o)
end

function option(o)
	if o == 1 then
		selectAll()
	elseif o == 2 then
		bulkUpdate()
	elseif o == 3 then
		insertRow()
	elseif o == 4 then
		print("Option 4")
	elseif o == 5 then
		deleteRow()
	elseif o == 6 then
		displayOptions()
	elseif o == 7 then
		print("Exiting")
		return 0
	else
		error("Something broke")
		return -1
	end
	return promptOption()
end

function game()
	displayOptions()
	promptOption()
end


print("starting")

createTable()
selectAll()
game()