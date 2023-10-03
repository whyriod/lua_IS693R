function a() 
	local count = 0
	return function()
		count = count + 1
		return count
	end
end
		
local counter = a()
local counter2 = a()

print(counter())
print(counter())
print(counter())
print(counter2())
