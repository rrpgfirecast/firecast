
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
	
	
function criarPathAreaTriangulo(Altura, Largura)
	local reach = (Altura) + (Largura);
	local path = "M 0 0 h " .. reach;

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

	path = path .. " Z";

	return path;			
									
end;


function criarPathAreaCirculo(Raio)
		local reach = Raio;
		local path = "M " .. reach .. " 0";

		path = path .. " h 1";

		for i=1, reach, 1 do
			if i == 1 then
				path = path .. " h " .. 1;
			elseif i==2 then
				path = path .. " v " .. 1;
			else
				local ending = (i-2)%3;
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

		path = path .. " v 1";

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

		path = path .. " h -1";

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

		path = path .. " v -1";

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


function criarPathAreaConeHorizontal(Raio)
	local reach = Raio;
	local multy = 1;
	local path = "M 0 0";
	local height = math.ceil(reach*multy/2);
	

	for i=1, height, 1 do
		path = path .. " v -1 h " .. multy;
	end;

	for i=reach, 1, -1 do
		if i == 1 then
			path = path .. " v 1";
		elseif i == 2 then
			path = path .. " h " .. multy;
		else 
			local ending = (i-2)%3;
			if ending == 0 then
				path = path .. " h " .. multy;
			else
				path = path .. " v 1";
			end;
		end;
	end;

	for i=1, reach, 1 do
		if i == 1 then
			path = path .. " v 1";
		elseif i == 2 then
			path = path .. " h -" .. multy;
		else 
			local ending = (i-2)%3;
			if ending == 0 then
				path = path .. " h -" .. multy;
			else
				path = path .. " v 1";
			end;
		end;
	end;

	for i=height, 1, -1 do
		path = path .. " h -" .. multy .. " v -1";
	end;

	path = path .. " Z";	
	
	return path;			
									
end;