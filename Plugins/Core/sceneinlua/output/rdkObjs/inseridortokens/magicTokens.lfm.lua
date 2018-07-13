require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");

function newfrmMagicTokens()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = GUI.fromHandle(_obj_newObject("popupForm"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setName("frmMagicTokens");
    obj:setWidth(250);
    obj:setHeight(200);
    obj:setDrawContainer(true);
    obj:setResizable(true);
    obj:setPlacement("center");
    obj:setCancelable(false);


		require("system.lua");
		require("rrpgScene_Undo.dlua");
		require("dialogs.lua");
		require("fireDrive.lua");
		local scene = nil;	
	


    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.flaContent = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flaContent:setParent(obj.scrollBox1);
    obj.flaContent:setAlign("top");
    obj.flaContent:setAutoHeight(true);
    obj.flaContent:setMaxControlsPerLine(1);
    obj.flaContent:setName("flaContent");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flaContent);
    obj.flowPart1:setName("flowPart1");
    obj.flowPart1:setHeight(30);
    obj.flowPart1:setMinWidth(50);
    obj.flowPart1:setMaxWidth(5000);
    obj.flowPart1:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labGroupHeader1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGroupHeader1:setParent(obj.flowPart1);
    obj.labGroupHeader1:setName("labGroupHeader1");
    obj.labGroupHeader1:setAlign("left");
    obj.labGroupHeader1:setAutoSize(true);
    obj.labGroupHeader1:setWordWrap(false);
    obj.labGroupHeader1:setHorzTextAlign("leading");
    obj.labGroupHeader1:setVertTextAlign("center");
    obj.labGroupHeader1:setMargins({left=10, right=5});
    obj.labGroupHeader1:setFontSize(15);
    obj.labGroupHeader1:setFontColor("#FFCC66");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.flowPart1);
    obj.horzLine1:setAlign("bottom");
    obj.horzLine1:setStrokeColor("#FFCC6670");
    obj.horzLine1:setMargins({left=10});
    obj.horzLine1:setName("horzLine1");


			self.labGroupHeader1.text = lang("scene.magic.title");
		


    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flaContent);
    obj.flowPart2:setName("flowPart2");
    obj.flowPart2:setHeight(30);
    obj.flowPart2:setMinWidth(50);
    obj.flowPart2:setMaxWidth(5000);
    obj.flowPart2:setMargins({left=2, right=2, top=2, bottom=2});

    obj.areaLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.areaLabel:setParent(obj.flowPart2);
    obj.areaLabel:setName("areaLabel");
    obj.areaLabel:setAlign("left");
    obj.areaLabel:setWidth(110);
    obj.areaLabel:setAutoSize(false);
    obj.areaLabel:setHorzTextAlign("trailing");
    obj.areaLabel:setVertTextAlign("center");
    obj.areaLabel:setMargins({right=5});

    obj.areaType = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.areaType:setParent(obj.flowPart2);
    obj.areaType:setName("areaType");
    obj.areaType:setAlign("client");
    obj.areaType:setMargins({right=5});

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flaContent);
    obj.flowPart3:setName("flowPart3");
    obj.flowPart3:setHeight(30);
    obj.flowPart3:setMinWidth(50);
    obj.flowPart3:setMaxWidth(5000);
    obj.flowPart3:setMargins({left=2, right=2, top=2, bottom=2});

    obj.reachLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.reachLabel:setParent(obj.flowPart3);
    obj.reachLabel:setName("reachLabel");
    obj.reachLabel:setAlign("left");
    obj.reachLabel:setWidth(110);
    obj.reachLabel:setAutoSize(false);
    obj.reachLabel:setHorzTextAlign("trailing");
    obj.reachLabel:setVertTextAlign("center");
    obj.reachLabel:setMargins({right=5});

    obj.square = GUI.fromHandle(_obj_newObject("label"));
    obj.square:setParent(obj.flowPart3);
    obj.square:setName("square");
    obj.square:setAlign("right");
    obj.square:setWidth(80);
    obj.square:setAutoSize(false);
    obj.square:setHorzTextAlign("leading");
    obj.square:setVertTextAlign("center");
    obj.square:setMargins({right=5});

    obj.reachVal = GUI.fromHandle(_obj_newObject("edit"));
    obj.reachVal:setParent(obj.flowPart3);
    obj.reachVal:setName("reachVal");
    obj.reachVal:setType("number");
    obj.reachVal:setMin(1);
    obj.reachVal:setAlign("client");
    obj.reachVal:setMargins({right=5});

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flaContent);
    obj.flowPart4:setName("flowPart4");
    obj.flowPart4:setHeight(30);
    obj.flowPart4:setMinWidth(50);
    obj.flowPart4:setMaxWidth(5000);
    obj.flowPart4:setMargins({left=2, right=2, top=2, bottom=2});

    obj.colorLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.colorLabel:setParent(obj.flowPart4);
    obj.colorLabel:setName("colorLabel");
    obj.colorLabel:setAlign("left");
    obj.colorLabel:setWidth(110);
    obj.colorLabel:setAutoSize(false);
    obj.colorLabel:setHorzTextAlign("trailing");
    obj.colorLabel:setVertTextAlign("center");
    obj.colorLabel:setMargins({right=5});

    obj.colorBox = GUI.fromHandle(_obj_newObject("colorComboBox"));
    obj.colorBox:setParent(obj.flowPart4);
    obj.colorBox:setName("colorBox");
    obj.colorBox:setWidth(50);
    obj.colorBox:setUseAlpha(true);
    obj.colorBox:setAlign("left");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setName("layout1");
    obj.layout1:setAlign("bottom");
    obj.layout1:setMargins({top=2, bottom=2});
    obj.layout1:setHeight(40);

    obj.btnInsert = GUI.fromHandle(_obj_newObject("button"));
    obj.btnInsert:setParent(obj.layout1);
    obj.btnInsert:setWidth(80);
    obj.btnInsert:setHorzTextAlign("center");
    obj.btnInsert:setAlign("right");
    obj.btnInsert:setName("btnInsert");
    obj.btnInsert:setMargins({left=4, right=4});

    obj.btnCancelName = GUI.fromHandle(_obj_newObject("button"));
    obj.btnCancelName:setParent(obj.layout1);
    obj.btnCancelName:setWidth(80);
    obj.btnCancelName:setHorzTextAlign("center");
    obj.btnCancelName:setAlign("right");
    obj.btnCancelName:setName("btnCancelName");
    obj.btnCancelName:setMargins({left=4, right=4});


			self.btnInsert.text = lang('scene.inseridor.buttons.insert');
			self.btnCancelName.text = lang('scene.inseridor.buttons.Close');
		



		local multx = 1;
		local multy = 1;
		
		self.areaLabel.text = lang('scene.magic.areaLabel');
		self.areaType.items = {lang("scene.magic.areaType1"), lang("scene.magic.areaType2"), lang("scene.magic.areaType3"), lang("scene.magic.areaType4"), lang("scene.magic.areaType5"), lang("scene.magic.areaType6")};
		self.areaType.value = lang("scene.magic.areaType4");

		self.reachLabel.text = lang('scene.magic.reachLabel');
		self.reachVal.text = "4";
		self.square.text = lang('scene.magic.square');

		self.colorLabel.text = lang('scene.magic.colorLabel');
		self.colorBox.color = "#FF00007F";

		function self:prepareForShow(oScene)
			scene = oScene;
		end;

		function self:createConeDiagonally()
			local reach = tonumber(self.reachVal.text) or 1;
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

			self:createToken(path);
		end;

		function self:createConeHorizontally()
			local reach = tonumber(self.reachVal.text) or 1;
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

			self:createToken(path);
		end;

		function self:createHalfCircle()
			local reach = tonumber(self.reachVal.text) or 1;
			local path = "M 0 0";

			for i=1, reach, 1 do
				if i == 1 then
					path = path .. " h " .. 2;
				elseif i==2 then
					path = path .. " v " .. 1;
				else
					local ending = (i-2)%3;
					if ending == 0 then
						path = path .. " v " .. 1;
					else
						path = path .. " h " .. 2;
					end;
				end;
			end;

			for i=reach, 1, -1 do
				if i == 1 then
					path = path .. " v " .. 1;
				elseif i==2 then
					path = path .. " h " .. 2;
				else
					local ending = (i-2)%3;
					if ending == 0 then
						path = path .. " h " .. 2;
					else
						path = path .. " v " .. 1;
					end;
				end;
			end;

			for i=1, reach, 1 do
				if i == 1 then
					path = path .. " v " .. 1;
				elseif i==2 then
					path = path .. " h -" .. 2;
				else
					local ending = (i-2)%3;
					if ending == 0 then
						path = path .. " h -" .. 2;
					else
						path = path .. " v " .. 1;
					end;
				end;
			end;

			for i=reach, 1, -1 do
				if i == 1 then
					path = path .. " h -" .. 2;
				elseif i==2 then
					path = path .. " v " .. 1;
				else
					local ending = (i-2)%3;
					if ending == 0 then
						path = path .. " v " .. 1;
					else
						path = path .. " h -" .. 2;
					end;
				end;
			end;

			path = path .. " Z";

			self:createToken(path);
		end;

		function self:createCircle()
			local reach = tonumber(self.reachVal.text) or 1;
			local path = "M " .. reach .. " 0";

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

			self:createToken(path);
		end;

		function self:createSquare()
			local reach = tonumber(self.reachVal.text) or 1;
			local path = "M 0 0 h " .. reach .. " v " .. reach .. " h -" .. reach .. " Z";
			self:createToken(path);
		end;

		function self:createEmanacao()
			local reach = tonumber(self.reachVal.text) or 1;
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

			self:createToken(path);
		end;

		function self:createToken(path)
			local reach = tonumber(self.reachVal.text) or 1;
			local size = scene.grid.cellSize;

			local _lastMouseDown = rawget(scene, "_lastMouseDown");	
			if _lastMouseDown ~= nil then
				y, x = scene.grid:worldToCell(_lastMouseDown.x, _lastMouseDown.y);
			else
				y, x = scene.grid:worldToCell((scene.worldWidth / 2), (scene.worldHeight / 2));
			end;

			local token = scene.items:addToken("tokens");
			token.x = x * size + scene.grid.offsetX;
			token.y = y * size + scene.grid.offsetY;
			token.width = reach * size * multx;
			token.height = reach * size * multy;
			token.name = self.areaType.value .. " de " .. reach .. " " .. lang("scene.magic.square") .. ".";

			opGrafica = token.canvas:addPath();
			opGrafica.name = self.areaType.value .. " de " .. reach .. " " .. lang("scene.magic.square") .. ".";
			opGrafica.x = 0;
			opGrafica.y = 0;
			opGrafica.width = 1;
			opGrafica.height = 1;
			opGrafica.z = 10; 
			opGrafica.color = self.colorBox.color;
            opGrafica.strokeSize = 1;
            opGrafica.pathData = path;
			
			scene.items:clearSelection();			
			token.selected = true;			
		end;

		local function round(num, numDecimalPlaces)
			local mult = 10^(numDecimalPlaces or 0)
			return math.floor(num * mult + 0.5) / mult
		end

		function self:processarOK()	
			local opt = self.areaType.value;
			local reach = tonumber(self.reachVal.text) or 1;
			multx = 1;
			multy = 1;

			if opt == lang("scene.magic.areaType1") then
				self:createConeDiagonally();
			elseif opt == lang("scene.magic.areaType2") then
				local max = reach * 2;
				local redux = round(reach/3)*2;
				multy = (max-redux)/reach;
				self:createConeHorizontally();
			elseif opt == lang("scene.magic.areaType3") then
				multy = 2;
				self:createHalfCircle();
			elseif opt == lang("scene.magic.areaType4") then
				multx = 2;
				multy = 2;
				self:createCircle();
			elseif opt == lang("scene.magic.areaType5") then
				self:createSquare();
			elseif opt == lang("scene.magic.areaType6") then
				multy = ((reach*2)+1)/reach;
				multx = multy;
				self:createEmanacao();
			end;

			self:processarCancel();
		end;
		
		function self:processarCancel()
			self:close();
		end;
		


    obj._e_event0 = obj:addEventListener("onKeyUp",
        function (_, event)
            if (event.keyCode == 0x89) or (event.keyCode == 0x1B) then
            			setTimeout(
            				function()
            					self:processarCancel();
            				end, 1);
            			
            			event.keyCode = 0;
            			event.key = "";
            		end;
        end, obj);

    obj._e_event1 = obj:addEventListener("onCancelRequest",
        function (_)
            self:processarCancel();
        end, obj);

    obj._e_event2 = obj.btnInsert:addEventListener("onClick",
        function (_)
            self:processarOK()
        end, obj);

    obj._e_event3 = obj.btnCancelName:addEventListener("onClick",
        function (_)
            self:processarCancel()
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.colorBox ~= nil then self.colorBox:destroy(); self.colorBox = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.areaType ~= nil then self.areaType:destroy(); self.areaType = nil; end;
        if self.flaContent ~= nil then self.flaContent:destroy(); self.flaContent = nil; end;
        if self.btnCancelName ~= nil then self.btnCancelName:destroy(); self.btnCancelName = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.areaLabel ~= nil then self.areaLabel:destroy(); self.areaLabel = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.reachVal ~= nil then self.reachVal:destroy(); self.reachVal = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.reachLabel ~= nil then self.reachLabel:destroy(); self.reachLabel = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.labGroupHeader1 ~= nil then self.labGroupHeader1:destroy(); self.labGroupHeader1 = nil; end;
        if self.btnInsert ~= nil then self.btnInsert:destroy(); self.btnInsert = nil; end;
        if self.square ~= nil then self.square:destroy(); self.square = nil; end;
        if self.colorLabel ~= nil then self.colorLabel:destroy(); self.colorLabel = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmMagicTokens = {
    newEditor = newfrmMagicTokens, 
    new = newfrmMagicTokens, 
    name = "frmMagicTokens", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "", 
    description=""};

frmMagicTokens = _frmMagicTokens;
Firecast.registrarForm(_frmMagicTokens);

return _frmMagicTokens;
