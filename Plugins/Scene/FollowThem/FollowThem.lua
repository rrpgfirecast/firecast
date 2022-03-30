require("scene.lua");

SceneLib.registerPlugin(
    function (scene, attachment)
        -- cannot save followers when scene is closed
        -- remove all following marks for now
        for i=1, scene.items.count, 1 do
            local opGrafica = scene.items[i].canvas:findByName("Following");
            if opGrafica ~= nil then opGrafica:delete() end
        end

    	scene.viewport:setupToolCategory("FollowMe", LANG("scene.follow"), -5);

        local listenerMouseDown = nil;
        local listenerMouseMove = nil;

        local currentHover = nil; -- token/graphic item com isHover true

        local follower = nil;
        local counter = 0;
        local node = NDB.load("followers.xml");
        if node.listenerAfterDraw~= nil then
            scene.viewport:unlisten(node.listenerAfterDraw)
            node.listenerAfterDraw = nil;
        end
        local followerTable = {}
        
        local function processarCurrentHover(event)
            local wx, wy = scene.viewport:screenToWorld(event.x, event.y);      
            local objHover = scene.items:itemAtPoint(wx, wy, scene.workingLayer);
        
            if objHover ~= currentHover then
                if currentHover ~= nil then
                    currentHover.isHover = false;
                    currentHover = nil;
                end;
                
                currentHover = objHover;
                
                if currentHover ~= nil then
                    currentHover.isHover = true;
                end;
            end;
        end;

        local function dump(o)
           if type(o) == 'table' then
              local s = '{ '
              for k,v in pairs(o) do
                 if type(k) ~= 'number' then k = '"'..k..'"' end
                 s = s .. '['..k..'] = ' .. dump(v) .. ','
              end
              return s .. '} '
           else
              return tostring(o)
           end
        end

        local function FollowThem(v)
            local offsetX = scene.grid.offsetX
            local offsetY = scene.grid.offsetY
            local cellSize = scene.grid.cellSize

            local x1 = math.floor((v.follower.x-offsetX)/cellSize)
            local y1 = math.floor((v.follower.y-offsetY)/cellSize)
            local x2 = math.floor((v.target.x-offsetX)/cellSize)
            local y2 = math.floor((v.target.y-offsetY)/cellSize)

            --showMessage("follower: " .. x1 .. "," .. y1 .. ", target: "  .. x2 .. "," .. y2);

            local success, distance, steps = scene.grid:shortestPath(y1, x1, y2, x2, 
                        {diagonals=scene.grid.squareDiagonals,trackCollisions=true,collisionRadius=0.001})

            if steps~=nil and #steps > v.distance then
                local cells = #steps - v.distance

                if steps[cells+1] ~= nil then
                    v.follower.x = (steps[cells+1].j*cellSize) + offsetX
                    v.follower.y = (steps[cells+1].i*cellSize) + offsetY
                end
            end
        end

        local function checkTargetMovement(event)
            for k,v in pairs(followerTable) do
                local x = math.floor((v.target.x-scene.grid.offsetX)/scene.grid.cellSize)
                local y = math.floor((v.target.y-scene.grid.offsetY)/scene.grid.cellSize)
                if x ~= v.targetX or y ~= v.targetY then
                    v.targetX = x 
                    v.targetY = y
                    FollowThem(v)
                    --showMessage("Target Moved " .. k)
                end
            end
        end

        local function mouseDown_Select(event)
            processarCurrentHover(event);
                    
            -- Converter para métrica de mundo a posição do clique
            local wx, wy = scene.viewport:screenToWorld(event.x, event.y);
            
            -- Descobrir qual item se encontra neste ponto
            objMouseDown = scene.items:itemAtPoint(wx, wy, scene.workingLayer);
                        
            if objMouseDown == nil then return end

            if follower==nil then
            	-- Salve o primeiro token, o que vai seguir
            	follower = objMouseDown

                -- encontre o icone de seguindo
            	local opGrafica = follower.canvas:findByName("Following");

                -- se o icone de seguindo n existir, crie
            	if opGrafica==nil then
            		opGrafica = objMouseDown.canvas:addBitmap();
            		opGrafica.name = "Following"
            		opGrafica.x = 0.25;
                    opGrafica.width = 0.3;
                    opGrafica.y = -0.1;
                    opGrafica.height = 0.3;
                    opGrafica.z = 10;
            	end
                -- atualize o item para mostrar que é o token 'selecionado'
                opGrafica.url = "http://blob.firecast.com.br/blobs/BKAEGHAK_2149065/followSelect.png"
            else 
            	-- Segundo token foi clicado
            	if follower==objMouseDown then
            		-- clicou no mesmo token
            		local opGrafica = follower.canvas:findByName("Following");
            		if opGrafica~=nil then opGrafica:delete() end

                    -- se esse follower estiver na lista remova-o
                    if followerTable[follower.objectID] ~= nil then
                        counter = counter - 1
                        followerTable[follower.objectID] = nil

                        -- se for o ultimo folower da lista remova o evento
                        if counter==0 then 
                            scene.viewport:unlisten(node.listenerAfterDraw)
                            node.listenerAfterDraw = nil
                        end
                        
                    end
            	else
            		-- clicou em outro token
            		local offsetX = scene.grid.offsetX
            		local offsetY = scene.grid.offsetY
            		local cellSize = scene.grid.cellSize

                    -- pegue a posição em grid desses tokens
            		local x1 = math.floor((follower.x-offsetX)/cellSize)
            		local y1 = math.floor((follower.y-offsetY)/cellSize)
            		local x2 = math.floor((objMouseDown.x-offsetX)/cellSize)
            		local y2 = math.floor((objMouseDown.y-offsetY)/cellSize)

                    -- encontre o caminho
            		local success, distance, steps = scene.grid:shortestPath(y1, x1, y2, x2, 
            			{diagonals=scene.grid.squareDiagonals,trackCollisions=true,collisionRadius=0.001})

            		--showMessage("Result: " .. (tostring(success) or "nil") .. ", distance: " .. (distance or "nil") .. ", steps: " .. (tostring(steps) or "nil"));

                    if steps ~= nil then
                        -- se houver um caminho inicie a ligação

                        -- se for um novo seguir aumente o contador
            		    if followerTable[follower.objectID]==nil then counter = counter+1 end

                        -- Crie um novo elemento na lista de seguidores ou atualize um antigo
                        followerTable[follower.objectID] = {}

                        followerTable[follower.objectID].follower = follower
                        followerTable[follower.objectID].target = objMouseDown
                        followerTable[follower.objectID].targetX = x2
                        followerTable[follower.objectID].targetY = y2
                        followerTable[follower.objectID].distance = #steps

                        -- Se não tiver um listener pro evento, adicione
                        if node.listenerAfterDraw==nil then
                            node.listenerAfterDraw = scene.viewport:listen("onAfterDrawLayers", checkTargetMovement);
                        end

                        -- Atualize o icone para mostrar que está seguindo alguém
                        local opGrafica = follower.canvas:findByName("Following");
                        if opGrafica~=nil then
                            opGrafica.url = "http://blob.firecast.com.br/blobs/BKWWTLPP_2147603/follow.png"
                        end
                    else
                        -- se não houver um caminho entre os tokens, avise
                        showMessage(LANG("scene.follow.noconnection"))
                        return
                    end

            		
            	end

            	-- Deselecione o token marcado
            	follower = nil
            end
        end
        local function mouseMove_Move(event)          
            processarCurrentHover(event);
        end

        scene.viewport:addToolButton("FollowMe", 
                                     LANG("scene.follow"), 
                                     "/images/follow.png",
                                     1,
                                     {selectable=true, defaultOfCategory=true},
                    function()
                        listenerMouseDown = scene.viewport:listen("onMouseDown", mouseDown_Select);
                        listenerMouseMove = scene.viewport:listen("onMouseMove", mouseMove_Move);
                    end,
                    function()
                    	if follower ~= nil then
            				local opGrafica = follower.canvas:findByName("Following");
            				if opGrafica~=nil then opGrafica:delete() end
            				follower = nil
                    	end
                        scene.viewport:unlisten(listenerMouseDown);
                        scene.viewport:unlisten(listenerMouseMove);

                    end)
        scene.viewport:addToolButton("FollowMe", 
                                     LANG("scene.nofollow"), 
                                     "/images/stop.png",
                                     2,
                                     {dontFocus=true},
                    function()
                        -- remova o listerner do evento
                        if node.listenerAfterDraw~=nil then
                            scene.viewport:unlisten(node.listenerAfterDraw) 
                            node.listenerAfterDraw = nil;
                        end
                        -- Zere a tabela de seguidores
                        counter = 0;

                        -- Limpe a tabela de seguidores
                        for k,v in pairs(followerTable) do
                            local opGrafica = v.follower.canvas:findByName("Following");
                            if opGrafica~=nil then opGrafica:delete() end
                            followerTable[k] = nil
                        end
                        followerTable = {};

                        -- Remova o seguidor selecionado atualmente
                        if follower ~= nil then
                            local opGrafica = follower.canvas:findByName("Following");
                            if opGrafica~=nil then opGrafica:delete() end
                            follower = nil
                        end
                    end)

    end)