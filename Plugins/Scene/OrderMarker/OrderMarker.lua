require("scene.lua");

SceneLib.registerPlugin(

    function (scene, attachment)           

        scene.viewport:setupToolCategory("OrderMarker", LANG("scene.order"), -5);

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

        local function mouseDown_ManualOrder(event)
            processarCurrentHover(event);
                    
            -- Converter para métrica de mundo a posição do clique
            local wx, wy = scene.viewport:screenToWorld(event.x, event.y);
            
            -- Descobrir qual item se encontra neste ponto
            objMouseDown = scene.items:itemAtPoint(wx, wy, scene.workingLayer);
                        
            if objMouseDown == nil then return end

            Dialogs.inputQuery(LANG("scene.order"), LANG("scene.order.input"), "0",
                function (valor)
                    local val = tonumber(valor)
                    if val==nil then
                        showMessage(LANG("scene.order.invalid"))
                    else
                        local imgOpGrafica = objMouseDown.canvas:findByName("orderBG");
                        if imgOpGrafica==nil then 
                            imgOpGrafica = objMouseDown.canvas:addBitmap();
                            imgOpGrafica.name = "orderBG"
                            imgOpGrafica.url = "https://raw.githubusercontent.com/rrpgfirecast/firecast/master/Arts/Icons/18.png"
                            imgOpGrafica.rotMode = "ignoreCanvasRot"
                            imgOpGrafica.outOfOrderMode = "afterOwnerLayer"
                            imgOpGrafica.drawingTrigger = {"hover", "selected"}
                            imgOpGrafica.x = 0.7
                            imgOpGrafica.width = 0.4
                            imgOpGrafica.y = 0.05
                            imgOpGrafica.height = 0.4
                            imgOpGrafica.z = 10.5
                        end

                        local textOpGrafica = objMouseDown.canvas:findByName("order");
                        if textOpGrafica==nil then 
                            textOpGrafica = objMouseDown.canvas:addText();
                            textOpGrafica.name = "order"
                            textOpGrafica.rotMode = "ignoreCanvasRot"
                            textOpGrafica.horzTextAlign = "trailing"
                            textOpGrafica.outOfOrderMode = "afterOwnerLayer"
                            textOpGrafica.fontStyle = {"bold", "italic"} 
                            textOpGrafica.drawingTrigger = {"hover", "selected"}
                            textOpGrafica.height = 0.3
                            textOpGrafica.y = 0.1
                            textOpGrafica.z = 11
                        end

                        textOpGrafica.text = val
                    end
                end)
        end
        local function mouseMove_Move(event)          
            processarCurrentHover(event);
        end

        scene.viewport:addToolButton("OrderMarker", 
                                     LANG("scene.order.selected"), 
                                     "/images/Order.png",
                                     2,
                                     {dontFocus=true},
                    function()
                        for k=1, #scene.items.selection, 1 do
                            local iterationUmToken = scene.items.selection[k];

                            local imgOpGrafica = iterationUmToken.canvas:findByName("orderBG");
                            if imgOpGrafica==nil then 
                                imgOpGrafica = iterationUmToken.canvas:addBitmap();
                                imgOpGrafica.name = "orderBG"
                                imgOpGrafica.url = "https://raw.githubusercontent.com/rrpgfirecast/firecast/master/Arts/Icons/18.png"
                                imgOpGrafica.rotMode = "ignoreCanvasRot"
                                imgOpGrafica.outOfOrderMode = "afterOwnerLayer"
                                imgOpGrafica.drawingTrigger = {"hover", "selected"}
                                imgOpGrafica.x = 0.7
                                imgOpGrafica.width = 0.4
                                imgOpGrafica.y = 0.05
                                imgOpGrafica.height = 0.4
                                imgOpGrafica.z = 10.5
                            end

                            local textOpGrafica = iterationUmToken.canvas:findByName("order");
                            if textOpGrafica==nil then 
                                textOpGrafica = iterationUmToken.canvas:addText();
                                textOpGrafica.name = "order"
                                textOpGrafica.rotMode = "ignoreCanvasRot"
                                textOpGrafica.horzTextAlign = "trailing"
                                textOpGrafica.outOfOrderMode = "afterOwnerLayer"
                                textOpGrafica.fontStyle = {"bold", "italic"} 
                                textOpGrafica.drawingTrigger = {"hover", "selected"}
                                textOpGrafica.height = 0.3
                                textOpGrafica.y = 0.1
                                textOpGrafica.z = 11
                            end

                            textOpGrafica.text = k

                            --if iterationOpGrafica~=nil then 
                            --    iterationOpGrafica:delete()
                            --end
                        end
                        
                    end)
        scene.viewport:addToolButton("OrderMarker", 
                                     LANG("scene.order.clean"), 
                                     "/images/OrderClean.png",
                                     3,
                                     {dontFocus=true},
                    function()
                        for k=1, #scene.items.selection, 1 do
                            local iterationUmToken = scene.items.selection[k];

                            local imgOpGrafica = iterationUmToken.canvas:findByName("orderBG");
                            if imgOpGrafica~=nil then 
                                imgOpGrafica:delete()
                            end

                            local textOpGrafica = iterationUmToken.canvas:findByName("order");
                            if textOpGrafica~=nil then 
                                textOpGrafica:delete()
                            end
                        end
                        
                    end)

        scene.viewport:addToolButton("OrderMarker", 
                                     LANG("scene.order.manual"), 
                                     "/images/Synchronize.png",
                                     4,
                                     {selectable=true, defaultOfCategory=false},
                    function()
                        listenerMouseDown = scene.viewport:listen("onMouseDown", mouseDown_ManualOrder);
                        listenerMouseMove = scene.viewport:listen("onMouseMove", mouseMove_Move);
                    end,
                    function()
                        scene.viewport:unlisten(listenerMouseDown);
                        scene.viewport:unlisten(listenerMouseMove);

                    end)
               
    end);