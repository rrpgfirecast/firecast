require("gui.lua");
require("rrpg.lua");
require("plugins.lua");

local function td_carregarTD(mesa, tdInstalado)
	if mesa.podeTablesDock and not rrpg.plugins.getIsTablesDockActive(mesa, tdInstalado.moduleId, tdInstalado.name) then
	
		local tdGlobal = require("/GerTablesDock/GerTablesDockGlobal.dlua");
		local tdN = tdGlobal.getNDBForMesaTablesDock(mesa, tdInstalado.moduleId, tdInstalado.name, false);
		local si = nil;		
		
		if tdN ~= nil then
			si = tdN.storedInfo;
		end;
	
		rrpg.plugins.activateTablesDock(mesa, tdInstalado.moduleId, tdInstalado.name, si);
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
		n.storedInfo = rrpg.plugins.getActiveTablesDockStoredInfo(mesa, tdInstalado.moduleId, tdInstalado.name);
	end;
end;

local function td_descarregarTDSeNecessario(mesa, tdInstalado)
	if rrpg.plugins.getIsTablesDockActive(mesa, tdInstalado.moduleId, tdInstalado.name) then
		rrpg.plugins.deactivateTablesDock(mesa, tdInstalado.moduleId, tdInstalado.name);
	end;
end;

local function td_anexarAMesa(mesa)	
	local tdsInstalados = rrpg.plugins.getInstalledTablesDock();
	
	for i = 1, #tdsInstalados, 1 do
		td_carregarTDSeNecessario(mesa, tdsInstalados[i]);
	end;
end;

local function td_salvarStoredInfoDaMesa(mesa)
	local tds = rrpg.plugins.getListOfActiveTablesDockOnMesa(mesa);
	
	for i = 1, #tds, 1 do
		td_salvarStoredInfo(mesa, tds[i]);
	end;	
end;

local function td_desanexarDaMesa(mesa)	
	td_salvarStoredInfoDaMesa(mesa);
end;

local jaInicializou = false;

rrpg.messaging.listen("MesaJoined", 
	function(msg)
		if jaInicializou then
			td_anexarAMesa(msg.mesa)
		end;
	end, {eu=true});
	
rrpg.messaging.listen("SpecialFormRegistered",
	function(msg)
		if jaInicializou then
			local mesas = rrpg.getMesas();
		
			for i = 1, #mesas, 1 do
				td_carregarTDSeNecessario(mesas[i], msg);
			end;
		end;
	end, {formType="tablesDock"});		
	
rrpg.messaging.listen("MesaParted", 
	function(msg)
		td_desanexarDaMesa(msg.mesa);		
	end, {eu=true});	
		
rrpg.messaging.listen("SessionLost", 
	function(msg)
		if jaInicializou then
			local mesas = rrpg.getMesas();
		
			for i = 1, #mesas, 1 do
				td_desanexarDaMesa(mesas[i]);
			end;	
		end;
	end);	

rrpg.messaging.listen("TablesDockClosedByUser", 
	function(msg)
		local tdGlobal = require("/GerTablesDock/GerTablesDockGlobal.dlua");
		local tdN = tdGlobal.getNDBForMesaTablesDock(msg.mesa, msg.moduleId, msg.name, false);
		
		if tdN ~= nil then
			tdN.ativo = false;
			tdN.storedInfo = nil;
		end;
	end);	
	
local _scheduledForSave = {};
	
rrpg.messaging.listen("TablesDockPosChanged", 
	function(msg)
		local id = tostring(msg.mesa.objectID) .. tostring(msg.moduleId) .. tostring(msg.name);
		
		if _scheduledForSave[id] == nil then
			_scheduledForSave[id] = true;
			
			setTimeout(function()
					_scheduledForSave[id] = nil;
					
					if rrpg.plugins.getIsTablesDockActive(msg.mesa, msg.moduleId, msg.name) then
						td_salvarStoredInfo(msg.mesa, msg);					
					end;
				end, 10000);
		end;		
	end);		
				
local function inicializar()
	jaInicializou = true;
	local mesas = rrpg.getMesas();
	
	for i = 1, #mesas, 1 do
		td_anexarAMesa(mesas[i]);
	end;
end;

function RRPG_GerTablesDock(chaveSal)
	local mesa = rrpg.getMesaDe(chaveSal);
	
	if mesa ~= nil then
		local frm = gui.newForm("frmGerTablesDock");
		frm.mesa = mesa;
		frm.loadTDFunction = td_carregarTD;
		frm.unloadTDFunction = td_descarregarTDSeNecessario;
		frm:show();
	end;
end;

setTimeout(inicializar, 100);