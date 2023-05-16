require("scene.lua");
require("utils.lua");
require("jsonparser.lua")
local base64 = require("base64.lua")

local config = NDB.load("uvttConfig.xml")

local function tinifyJPEG(url, name, scene)
	local request = Internet.newHTTPRequest("POST", url)
	request:setRequestHeader("Authorization","Basic " .. config.apiKey)
	request:setRequestHeader("Content-Type", "application/json");      

	request.onResponse =
		function()
			--showMessage(request.statusText)
			--showMessage(request:getAllResponseHeaders())

			-- UPLOAD MAP TO FIREDRIVE
			FireDrive.createDirectory("/uploads")

		  local date_table = os.date("*t")
		  local month = date_table.month
		  if month < 10 then
		  	month = "0"..month
		  end
			local subfolder = date_table.year.. "-" .. month

			FireDrive.createDirectory("/uploads/" .. subfolder)

			FireDrive.upload("/uploads/" .. subfolder .. "/" .. name..".jpeg", request.responseStream,
		    function(fditem)
					scene.bkgImageURL = fditem.url;	                		
		    end, nil, 
		    function(reason)
			  	--Save file locally
			  	Dialogs.saveFile("Salvar Imagem", request.responseStream, name..".jpeg", "image/jpeg")
		    end)			
		end
	request.onError =
    function(errorMsg)
    	if errorMsg == "HTTP/1.1 401 Unauthorized" then
    		config.apiKey = nil
      end
      showMessage("errorMsg: " .. errorMsg);
    end;
	
	--showMessage(request:getAllResponseHeaders())
	request:send( "{\"convert\": { \"type\": \"image/jpeg\" }}" )
end

local function tinifyShrink(file, name, scene)
	local request = Internet.newHTTPRequest("POST", "https://api.tinify.com/shrink")
	request:setRequestHeader("Authorization","Basic " .. config.apiKey)

	request.onResponse =
		function()
			--showMessage(request.statusText)
			--showMessage(request:getAllResponseHeaders())

			tinifyJPEG(request:getResponseHeader("Location"), name, scene)
		end
	request.onError =
    function(errorMsg)
    	if errorMsg == "HTTP/1.1 401 Unauthorized" then
    		config.apiKey = nil
      end
      showMessage("errorMsg: " .. errorMsg);
    end;
	
	request:send(file);
end

local function tinify(file, name, scene)
	if config.apiKey == nil or config.apiKey == "" then
		showMessage("Faça cadastro no tinypng para conseguir uma apiKey.")
		GUI.openInBrowser("https://tinypng.com/developers")
		Dialogs.inputQuery("ApiKey", "Informe sua ApiKey", "",
      function (value)
        config.apiKey = base64.encode("api:"..value)
        tinifyShrink(file, name, scene)
      end);
	else
		tinifyShrink(file, name, scene)
	end
end

SceneLib.registerPlugin(
	function (scene, attachment)
		scene.viewport:addToolButton("Gerador", 
		                             "Importar dd2vtt", 
									 "/icos/dd2vtt.png",
									 0,
									 {},
			function()
				if not scene.isGM then return end
				Dialogs.openFile("Selecione o arquivo", ".dd2vtt", false,
			    function(arquivos)
			        local arq = arquivos[1];

			        --showMessage(arq.name)
			        local str = arq.stream:readBinary("utf8")
			        local dg = decode(str)

			        local size = scene.grid.cellSize

			        scene.worldWidth = dg.resolution.map_size.x*size
			        scene.worldHeight = dg.resolution.map_size.y*size

			        local mapStream = Utils.newMemoryStream()
			        mapStream:writeBase64(dg.image)

			        -- UPLOAD MAP TO FIREDRIVE
			        FireDrive.createDirectory("/uploads")

		          local date_table = os.date("*t")
		          local month = date_table.month
		          if month < 10 then
		          	month = "0"..month
		          end
				    	local subfolder = date_table.year.. "-" .. month

				    	FireDrive.createDirectory("/uploads/" .. subfolder)

				    	FireDrive.upload("/uploads/" .. subfolder .. "/" .. arq.name..".png", mapStream,
		            function(fditem)
									scene.bkgImageURL = fditem.url;	                		
		            end, nil, 
		            function(reason)
									--showMessage("Falha ao subir imagem. Motivo: " .. reason .. ". Tente salvar a imagem localmente.")
									Dialogs.choose("Falha ao subir imagem. Motivo: " .. reason .. ".", {"Salvar Localmente", "Comprimir e converter para jpeg"},
		               	function(selected, selectedIndex, selectedText)
		                  if selected then
		                  	if selectedIndex==1 then
		                  		Dialogs.saveFile("Salvar Imagem", mapStream, arq.name..".png", "image/png")
		                  	elseif selectedIndex==2 then
		                  		tinify(mapStream, arq.name, scene)
		                  	end
		                  end
		               	end)
									
				        	--Save file locally
				        	--
		            end)

				    	local wallWidth = 0.05
				    	--wallWidth = 0.1
				    	local walls = false
				    	-- ADD WALLS
				    	for _,w in ipairs(dg.line_of_sight) do
				    		local index = 1
				    		while (w[index+1] ~= nil) do
					    		local polygon = {}
					    		local width = math.abs(w[index].x - w[index+1].x)
					    		local height = math.abs(w[index].y - w[index+1].y)
		
						  	  if width > height then
						  	  	polygon[1] = {x=(w[index].x)*size,y=(w[index].y-wallWidth)*size}
						  	  	polygon[2] = {x=(w[index+1].x)*size,y=(w[index+1].y-wallWidth)*size}
						  	  	polygon[3] = {x=(w[index+1].x)*size,y=(w[index+1].y+wallWidth)*size}
						  	  	polygon[4] = {x=(w[index].x)*size,y=(w[index].y+wallWidth)*size}
						  	  else
						  	  	polygon[1] = {x=(w[index].x-wallWidth)*size,y=(w[index].y)*size}
						  	  	polygon[2] = {x=(w[index+1].x-wallWidth)*size,y=(w[index+1].y)*size}
						  	  	polygon[3] = {x=(w[index+1].x+wallWidth)*size,y=(w[index+1].y)*size}
						  	  	polygon[4] = {x=(w[index].x+wallWidth)*size,y=(w[index].y)*size}
						  	  end
					    		scene.fogOfWar:addOpaqueArea(polygon)
					    		walls = true
					    		
					    		index = index + 1
				    		end
				    	end

				    	--ADD DOORS
				    	for _,p in ipairs(dg.portals) do
				    		local w = p.bounds
				    		local polygon = {}
				    		local width = math.abs(w[1].x - w[2].x)
				    		local height = math.abs(w[1].y - w[2].y)
	
					  	  if width > height then
					  	  	polygon[1] = {x=(w[1].x)*size,y=(w[1].y-wallWidth)*size}
					  	  	polygon[2] = {x=(w[2].x)*size,y=(w[2].y-wallWidth)*size}
					  	  	polygon[3] = {x=(w[2].x)*size,y=(w[2].y+wallWidth)*size}
					  	  	polygon[4] = {x=(w[1].x)*size,y=(w[1].y+wallWidth)*size}
					  	  else
					  	  	polygon[1] = {x=(w[1].x-wallWidth)*size,y=(w[1].y)*size}
					  	  	polygon[2] = {x=(w[2].x-wallWidth)*size,y=(w[2].y)*size}
					  	  	polygon[3] = {x=(w[2].x+wallWidth)*size,y=(w[2].y)*size}
					  	  	polygon[4] = {x=(w[1].x+wallWidth)*size,y=(w[1].y)*size}
					  	  end
				    		scene.fogOfWar:addOpaqueArea(polygon)
				    		walls = true
				    	end
	
				    	-- ADD AREA TO EXPLORE
				    	if walls then
				    		local polygon = {}
				    		polygon[1] = {x=0,y=0}
				    		polygon[2] = {x=scene.worldWidth,y=0}
				    		polygon[3] = {x=scene.worldWidth,y=scene.worldHeight}
				    		polygon[4] = {x=0,y=scene.worldHeight}
	
								scene.fogOfWar.enabled = true
				    		scene.fogOfWar:setArea(polygon,"explorable")
				    	end

				    	-- ADD LIGHTS
				    	for _,p in ipairs(dg.lights) do
				    		local light = scene.items:addToken("background")
				    		light.x = (p.position.x-0.5) * size
				    		light.y = (p.position.y-0.5) * size
				    		light.lightIntenseRange = p.range*size
								light.lightAngle = 360
				    	end
			    end)
	
			end)
	end)