require("scene.lua");

SceneLib.registerPlugin(

    function (scene, attachment)           

        scene.viewport:setupToolCategory("HeightMarker", LANG("scene.height"), -5);

        local listenerMouseDown = nil;
        local listenerMouseMove = nil;

        local currentHover = nil; -- token/graphic item com isHover true
        
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

        local function mouseDown_ChangeHeight(event)
            processarCurrentHover(event);
                    
            -- Converter para métrica de mundo a posição do clique
            local wx, wy = scene.viewport:screenToWorld(event.x, event.y);
            
            -- Descobrir qual item se encontra neste ponto
            objMouseDown = scene.items:itemAtPoint(wx, wy, scene.workingLayer);
                        
            if objMouseDown == nil then return end

            Dialogs.inputQuery(LANG("scene.height"), LANG("scene.height.input"), "0",
                function (valor)
                    local val = tonumber(valor)
                    if val==nil then
                        showMessage(LANG("scene.height.invalid"))
                    else
                        local opGrafica = objMouseDown.canvas:findByName("height");

                        if val ~= 0 then

                            if opGrafica==nil then 
                                opGrafica = objMouseDown.canvas:addText();
                                opGrafica.name = "height"
                                opGrafica.rotMode = "ignoreCanvasRot"
                                opGrafica.horzTextAlign = "center"
                                opGrafica.outOfOrderMode = "afterOwnerLayer"
                                opGrafica.fontStyle = {"bold", "italic"} 
                                opGrafica.drawingTrigger = {"hover", "selected"}
                                opGrafica.height = 0.3
                                opGrafica.y = 0.7
                                opGrafica.z = 11
                            end

                            opGrafica.text = "(" .. val .. "q)"
                        else
                            if opGrafica~=nil then 
                                opGrafica:delete()
                            end
                        end
                    end
                end)
        end
        local function mouseMove_Move(event)          
            processarCurrentHover(event);
        end

        scene.viewport:addToolButton("HeightMarker", 
                                     LANG("scene.height.select"), 
                                     "/images/height.png",
                                     1,
                                     {selectable=true, defaultOfCategory=true},
                    function()
                        listenerMouseDown = scene.viewport:listen("onMouseDown", mouseDown_ChangeHeight);
                        listenerMouseMove = scene.viewport:listen("onMouseMove", mouseMove_Move);
                    end,
                    function()
                        scene.viewport:unlisten(listenerMouseDown);
                        scene.viewport:unlisten(listenerMouseMove);

                    end)
        scene.viewport:addToolButton("HeightMarker", 
                                     LANG("scene.height.selected"), 
                                     "/images/Synchronize.png",
                                     2,
                                     {dontFocus=true},
                    function()
                        Dialogs.inputQuery(LANG("scene.height"), LANG("scene.height.input"), "0",
                            function (valor)
                                local val = tonumber(valor)
                                if val==nil then
                                    showMessage(LANG("scene.height.invalid"))
                                else
                                    for k=1, #scene.items.selection, 1 do
                                        local iterationUmToken = scene.items.selection[k];
                                        local iterationOpGrafica = iterationUmToken.canvas:findByName("height");

                                        if val ~= 0 then

                                            if iterationOpGrafica==nil then 
                                                iterationOpGrafica = iterationUmToken.canvas:addText();
                                                iterationOpGrafica.name = "height"
                                                iterationOpGrafica.rotMode = "ignoreCanvasRot"
                                                iterationOpGrafica.horzTextAlign = "center"
                                                iterationOpGrafica.outOfOrderMode = "afterOwnerLayer"
                                                iterationOpGrafica.fontStyle = {"bold", "italic"} 
                                                iterationOpGrafica.drawingTrigger = {"hover", "selected"}
                                                iterationOpGrafica.height = 0.3
                                                iterationOpGrafica.y = 0.7
                                                iterationOpGrafica.z = 11
                                            end

                                            iterationOpGrafica.text = "(" .. val .. "q)"
                                        else
                                            if iterationOpGrafica~=nil then 
                                                iterationOpGrafica:delete()
                                            end
                                        end

                                    end
                                end
                            end)
                    end)
               
    end);