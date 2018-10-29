require("gui.lua");
require("firecast.lua");
require("plugins.lua");

local function td_carregarTD(mesa, tdInstalado)
	if mesa.podeTablesDock and not Firecast.Plugins.getIsTablesDockActive(mesa, tdInstalado.moduleId, tdInstalado.name) then
	
		local tdGlobal = require("/GerTablesDock/GerTablesDockGlobal.dlua");
		local tdN = tdGlobal.getNDBForMesaTablesDock(mesa, tdInstalado.moduleId, tdInstalado.name, false);
		local si = nil;		
		
		if tdN ~= nil then
			si = tdN.storedInfo;
		end;
	
		Firecast.Plugins.activateTablesDock(mesa, tdInstalado.moduleId, tdInstalado.name, si);
	end;
end;

local function td_carregarTDSeNecessario(mesa, tdInstalado)
	if not mesa.podeTablesDock then
		return;
	end;
	
	local tdGlobal = require("/GerTablesDock/GerTablesDockGlobal.dlua");
	local tdN = tdGlobal.getNDBForMesaTablesDock(mesa, tdInstalado.moduleId, tdInstalado.name, false);
	
	if tdN ~= nil then
		if tdN.ativo then
			td_carregarTD(mesa, tdInstalado);
		end;
	end;
end;

local function td_salvarStoredInfo(mesa, tdInstalado)
	local tdGlobal = require("GerTablesDock/GerTablesDockGlobal.dlua");
	local n = tdGlobal.getNDBForMesaTablesDock(mesa, tdInstalado.moduleId, tdInstalado.name, true);	
			
	if n ~= nil then
		n.storedInfo = Firecast.Plugins.getActiveTablesDockStoredInfo(mesa, tdInstalado.moduleId, tdInstalado.name);
	end;
end;

local function td_descarregarTDSeNecessario(mesa, tdInstalado)
	if Firecast.Plugins.getIsTablesDockActive(mesa, tdInstalado.moduleId, tdInstalado.name) then
		Firecast.Plugins.deactivateTablesDock(mesa, tdInstalado.moduleId, tdInstalado.name);
	end;
end;

local function td_anexarAMesa(mesa)	
	local tdsInstalados = Firecast.Plugins.getInstalledTablesDock();
	
	for i = 1, #tdsInstalados, 1 do
		td_carregarTDSeNecessario(mesa, tdsInstalados[i]);
	end;
end;

local function td_salvarStoredInfoDaMesa(mesa)
	local tds = Firecast.Plugins.getListOfActiveTablesDockOnMesa(mesa);
	
	for i = 1, #tds, 1 do
		td_salvarStoredInfo(mesa, tds[i]);
	end;	
end;

local function td_desanexarDaMesa(mesa)	
	td_salvarStoredInfoDaMesa(mesa);
end;

local jaInicializou = false;

Firecast.Messaging.listen("MesaJoined", 
	function(msg)
		if jaInicializou then
			td_anexarAMesa(msg.mesa)
		end;
	end, {eu=true});
	
Firecast.Messaging.listen("SpecialFormRegistered",
	function(msg)
		if jaInicializou then
			local mesas = Firecast.getMesas();
		
			for i = 1, #mesas, 1 do
				td_carregarTDSeNecessario(mesas[i], msg);
			end;
		end;
	end, {formType="tablesDock"});		
	
Firecast.Messaging.listen("MesaParted", 
	function(msg)
		td_desanexarDaMesa(msg.mesa);		
	end, {eu=true});	
		
Firecast.Messaging.listen("SessionLost", 
	function(msg)
		if jaInicializou then
			local mesas = Firecast.getMesas();
		
			for i = 1, #mesas, 1 do
				td_desanexarDaMesa(mesas[i]);
			end;	
		end;
	end);	

Firecast.Messaging.listen("TablesDockClosedByUser", 
	function(msg)
		local tdGlobal = require("/GerTablesDock/GerTablesDockGlobal.dlua");
		local tdN = tdGlobal.getNDBForMesaTablesDock(msg.mesa, msg.moduleId, msg.name, false);
		
		if tdN ~= nil then
			tdN.ativo = false;
			tdN.storedInfo = nil;
		end;
	end);	
	
local _scheduledForSave = {};
	
Firecast.Messaging.listen("TablesDockPosChanged", 
	function(msg)
		local id = tostring(msg.mesa.objectID) .. tostring(msg.moduleId) .. tostring(msg.name);
		
		if _scheduledForSave[id] == nil then
			_scheduledForSave[id] = true;
			
			setTimeout(function()
					_scheduledForSave[id] = nil;
					
					if Firecast.Plugins.getIsTablesDockActive(msg.mesa, msg.moduleId, msg.name) then
						td_salvarStoredInfo(msg.mesa, msg);					
					end;
				end, 10000);
		end;		
	end);		
				
local function inicializar()
	jaInicializou = true;
	local mesas = Firecast.getMesas();
	
	for i = 1, #mesas, 1 do
		td_anexarAMesa(mesas[i]);
	end;
end;

function RRPG_GerTablesDock(chaveSal)
	local mesa = Firecast.getMesaDe(chaveSal);
	
	if mesa ~= nil then
		local frm = GUI.newForm("frmGerTablesDock");
		frm.mesa = mesa;
		frm.loadTDFunction = td_carregarTD;
		frm.unloadTDFunction = td_descarregarTDSeNecessario;
		frm:show();
	end;
end;

setTimeout(inicializar, 100);