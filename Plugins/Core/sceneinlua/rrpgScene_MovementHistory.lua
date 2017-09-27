require("scene.lua");
require("utils.lua");
require("ndb.lua");
require("rrpgScene_MovementPath.dlua");
	
local MAX_HISTORY_CHILDS = 7;	
	
local function removerExcessoMovHist(node)
	local childs = ndb.getChildNodes(node);
		
	if #childs > MAX_HISTORY_CHILDS then
		local qtRemover = #childs - MAX_HISTORY_CHILDS;
		
		table.sort(childs, 
			function(left, right)
				return (left.date or 0) < (right.date or 0);
			end);
			
		for i = 1, qtRemover, 1 do
			ndb.deleteNode(childs[i]);
		end;		
	end;		
end;

function MOVHIST_AddTrackHistory(token, track)
	local userData = token.userData;
	ndb.beginUpdate(userData);
	
	tryFinally(
		function()
			local movHist = userData.movHist;
			
			if type(movHist) ~= "table"  then
				userData.movHist = {};
				movHist = userData.movHist;	
			end;
				
			if movHist ~= nil then				
				local novoHistoryNode = ndb.createChildNode(movHist, "h");
				local trackTable = track:save();
				
				for k2, v2 in pairs(trackTable) do
					novoHistoryNode[k2] = v2;
				end;
				
				novoHistoryNode.date = ndb.getServerUTCTime(userData);	
				removerExcessoMovHist(movHist);	
			end;
		end,
		
		function()
			ndb.endUpdate(userData);		
		end);
	
	return novoHistoryNode;
end;

local jaCarregouUnidades = false;
local _movHistScene = {};
setmetatable(_movHistScene, {__mode="k"});

local function onHistToDrawChanged(scene, mh, hists)
	local tracksDrawing = mh.tracksDrawing;
	
	-- desativar old tracks drawing
	
	if tracksDrawing ~= nil then
		for i = 1, #tracksDrawing, 1 do
			local t = tracksDrawing[i];
			t:stopPaint();
		end;
	end;
	
	-- ativar novos tracks drawing
	
	tracksDrawing = {}; 
	mh.tracksDrawing = tracksDrawing;
	
	for i = 1, #hists, 1 do
		local h = hists[i];
		local t = MOVETRACK_newMoveTrack(scene, h.token);
		t:load(h.node);
		tracksDrawing[#tracksDrawing + 1] = t;
	end;
	
	for i = 1, #tracksDrawing, 1 do
		local t = tracksDrawing[i];
		t:startPaint();
	end;	
end;

function MOVHIST_get(scene)
	local mh = _movHistScene[scene] ;
	
	if mh == nil then
		if not jaCarregouUnidades then
			require("movementHistoryCore.dlua");	
			require("movementHistoryMonitor.dlua");			
		end;
		
		mh = MOVHIST_new(scene);
		mh.onHistToDrawChanged = onHistToDrawChanged;		
		MOVHIST_MONITOR_start(scene, mh);		
		mh:setDrawEnabled("xtool", false);
						
		_movHistScene[scene] = mh;		
	end;
	
	return mh;
end;

function MOVHIST_SetDrawEnabled(scene, reason, enable)
	local mh = MOVHIST_get(scene);
	return mh:setDrawEnabled(reason, enable);
end;

function MOVHIST_ToolEnable(scene, enabled)
	if enabled then	
		MOVHIST_SetDrawEnabled(scene, "xtool", true);
	else
		MOVHIST_SetDrawEnabled(scene, "xtool", false);
	end;	
end;

function MOVHIST_SetMode(scene, mode, param)
	local mh = MOVHIST_get(scene);
	return mh:setMode(mode, param);
end;


--[[   PLUGIN para histórico de movimento de tokens  ]]--	

local MOV_HIST_CATEGORY = 'movHist';
local nodeOptions = ndb.load("/options.xml");
	
SceneLib.registerPlugin(
	function (scene, attachment)		
		local movHist = MOVHIST_get(scene);
		local REASON_FOR_OPTION = 'userOption';
		
		scene.viewport:setupToolCategory(MOV_HIST_CATEGORY, lang("scene.toolcategory.movHistory"), -5);		
		
		local btn_ShowMovHist = nil;
		
		local function executeShowMovHist()
			if scene.viewport:isToolButtonChecked(btn_ShowMovHist) then
				scene.viewport:checkToolButton(btn_ShowMovHist, false);
				MOVHIST_SetDrawEnabled(scene, REASON_FOR_OPTION, false);				
				nodeOptions.showMovHist = false;
			else
				scene.viewport:checkToolButton(btn_ShowMovHist, true);
				MOVHIST_SetDrawEnabled(scene, REASON_FOR_OPTION, true);				
				nodeOptions.showMovHist = true;			
			end;
		end;
		
		btn_ShowMovHist = 
				scene.viewport:addToolButton(MOV_HIST_CATEGORY,
											 lang("scene.tool.movhist.showMovHist")	,
											 '/icos/history.png',
				 							 0,
											 nil, executeShowMovHist);
			
		if nodeOptions.showMovHist == nil then
			nodeOptions.showMovHist = false;
		end;
			
		if nodeOptions.showMovHist then
			scene.viewport:checkToolButton(btn_ShowMovHist, true);
			MOVHIST_SetDrawEnabled(scene, REASON_FOR_OPTION, true);
		else
			scene.viewport:checkToolButton(btn_ShowMovHist, false);
			MOVHIST_SetDrawEnabled(scene, REASON_FOR_OPTION, false);
		end;
		
	end);	