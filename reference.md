## loops
for i=1, #listOfRects do
    listOfRects[i].x = listOfRects[i].x + listOfRects[i].speed *delta
end

--for i=1, #fruits do -- Loop all fruits lols
--    print(fruits[i])
--end

--for i,v in ipairs(fruits) do
--   print(i,v)
--end


    function love.keypressed(key)
    end


local curVal = "SUS";
		local curType = 1;

		-- Massive if else lols
		if (c == "x") then -- End of chart type

					
		elseif (c== ",") then -- new value

			-- Push to table
			print(curVal);
			curVal = "SUS" --reset buffer

		elseif (c == " ") then-- Skippppp
			
			-- uuh skip

		else-- Append numbers
			
			print(curVal)
			print(c)
			curVal = curVal .. c; -- wtf lua

			
		end