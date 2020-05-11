
function criarPathAreaQuadrado()
	local reach = 1;
	local path = "M " .. reach .. " 0";
		
	for i = 1, reach, 1 do
		if i == 1 then
			path = path .. " h " .. 1;
		elseif i == 2 then
			path = path .. " v " .. 1;
		else
			local ending = (i - 2) % 3;
			
			if ending == 0 then
				path = path .. " v " .. 1;
			else
				path = path .. " h " .. 1;
			end;
		end;
	end;

	for i=reach, 1, -1 do
		if i == 1 then
			path = path .. " v " .. 1;
		elseif i==2 then
			path = path .. " h " .. 1;
		else
			local ending = (i-2)%3;
			if ending == 0 then
				path = path .. " h " .. 1;
			else
				path = path .. " v " .. 1;
			end;
		end;
	end;
	
	for i=1, reach, 1 do
		if i == 1 then
			path = path .. " v " .. 1;
		elseif i==2 then
			path = path .. " h -" .. 1;
		else
			local ending = (i-2)%3;
			if ending == 0 then
				path = path .. " h -" .. 1;
			else
				path = path .. " v " .. 1;
			end;
		end;
	end;

	for i=reach, 1, -1 do
		if i == 1 then
			path = path .. " h -" .. 1;
		elseif i==2 then
			path = path .. " v " .. 1;
		else
			local ending = (i-2)%3;
			if ending == 0 then
				path = path .. " v " .. 1;
			else
				path = path .. " h -" .. 1;
			end;
		end;
	end;

	for i=1, reach, 1 do
		if i == 1 then
			path = path .. " h -" .. 1;
		elseif i==2 then
			path = path .. " v -" .. 1;
		else
			local ending = (i-2)%3;
			if ending == 0 then
				path = path .. " v -" .. 1;
			else
				path = path .. " h -" .. 1;
			end;
		end;
	end;

	for i=reach, 1, -1 do
		if i == 1 then
			path = path .. " v -" .. 1;
		elseif i==2 then
			path = path .. " h -" .. 1;
		else
			local ending = (i-2)%3;
			if ending == 0 then
				path = path .. " h -" .. 1;
			else
				path = path .. " v -" .. 1;
			end;
		end;
	end;

	for i=1, reach, 1 do
		if i == 1 then
			path = path .. " v -" .. 1;
		elseif i==2 then
			path = path .. " h " .. 1;
		else
			local ending = (i-2)%3;
			if ending == 0 then
				path = path .. " h " .. 1;
			else
				path = path .. " v -" .. 1;
			end;
		end;
	end;

	for i=reach, 1, -1 do
		if i == 1 then
			path = path .. " h " .. 1;
		elseif i==2 then
			path = path .. " v -" .. 1;
		else
			local ending = (i-2)%3;
			if ending == 0 then
				path = path .. " v -" .. 1;
			else
				path = path .. " h " .. 1;
			end;
		end;
	end;

	path = path .. " Z";		
	return path;
end;
	
	
	