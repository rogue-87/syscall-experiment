local file = io.open("garbage.txt", "r")
if file ~= nil then
	local buffer = file:read("*a")
	print(buffer)
	file:close()
end
