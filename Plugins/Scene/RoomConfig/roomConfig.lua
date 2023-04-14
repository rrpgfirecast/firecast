require("scene.lua");

SceneLib.registerPlugin(

    function (scene, attachment)           

        scene.viewport:setupToolCategory("RoomConfig", LANG("scene.roomconfig.title"), 49);

        scene.viewport:addToolButton("RoomConfig", 
                                     LANG("scene.roomconfig.save"), 
                                     "/images/save.png",
                                     2,
                                     {dontFocus=true},
                    function()
                    	if scene.isGM then
                    		local node = NDB.load("sceneRoomConfig.xml")
                    		local mesa = Firecast.getMesaDe(scene)

                    		if not node.configs then
                    			node.configs = {}
                    		end

                    		if not node.configs[mesa.codigoInterno] then
                    			node.configs[mesa.codigoInterno] = {}
                    		end

                    		node.worldMetricName = scene.worldMetricName
							--grid
							node.gridType = scene.grid.gridType
							node.squareDiagonals = scene.grid.squareDiagonals
							node.cellSize = scene.grid.cellSize
							node.gridColor = scene.grid.gridColor
							node.gridThickness = scene.grid.gridThickness
							node.drawGrid = scene.grid.drawGrid
							--fogOfWar
							node.sharingMode = scene.fogOfWar.sharingMode
                    	end
                    end)
        scene.viewport:addToolButton("RoomConfig", 
                                     LANG("scene.roomconfig.load"), 
                                     "/images/load.png",
                                     3,
                                     {dontFocus=true},
                    function()
                    	if scene.isGM then
                    		local node = NDB.load("sceneRoomConfig.xml")
                    		local mesa = Firecast.getMesaDe(scene)

                    		if not node.configs then
                    			node.configs = {}
                    		end

                    		if not node.configs[mesa.codigoInterno] then
                    			node.configs[mesa.codigoInterno] = {}
                    		end

                    		scene.worldMetricName = node.worldMetricName
							--grid
							scene.grid.gridType = node.gridType
							scene.grid.squareDiagonals = node.squareDiagonals
							scene.grid.cellSize = node.cellSize
							scene.grid.gridColor = node.gridColor
							scene.grid.gridThickness = node.gridThickness
							scene.grid.drawGrid = node.drawGrid
							--fogOfWar
							scene.fogOfWar.sharingMode = node.sharingMode
                    	end
                        
                    end)
               
    end);