local open = io.open

function read_file(path)
    local file = open(path, "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

function StringIsNumber(str)
	return (tonumber(str) == nil) == false;
end

function read_chart(chartstr) -- Reads a string and does funny stuff
	local concat = ""
	local type = 1;
	local left = {}
	local right = {}
	local mid = {}

	for i = 1,#chartstr do -- Loop the string: Strings are just char arrays heh
		
		local c = chartstr:sub(i,i); -- get the char at i

		if StringIsNumber(c) then
			concat = concat .. c
		end

		if(tonumber(c) == nil) then -- Not a number
			if( c == "x") then
				type = type + 1;
			end

			if StringIsNumber(concat) then -- In concat steht etwas sinnvolles

				if( type == 1) then
					table.insert(left,concat);
				end
				if( type == 2) then
					table.insert(mid,concat);
				end
				if( type == 3) then
					table.insert(right,concat);
				end

				concat = ""
			end
		end

  	end
	print(concat)
	return left, mid, right;

end


