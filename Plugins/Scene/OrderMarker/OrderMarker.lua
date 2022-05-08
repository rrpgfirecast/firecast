require("scene.lua");

SceneLib.registerPlugin(

    function (scene, attachment)           

        scene.viewport:setupToolCategory("OrderMarker", LANG("scene.order"), -5);

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
               
    end);