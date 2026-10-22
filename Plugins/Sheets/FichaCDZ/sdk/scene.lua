local _SceneLib = require("delayedLoad.dlua").new("sceneCore.dlua");
local _SceneWrapperLib = nil;

function _INTERNAL_export_getSceneObjectFromID(objectID)
	if _SceneWrapperLib == nil then
		_SceneWrapperLib = require("sceneWrappers.dlua");
	end;
	
	return _SceneWrapperLib.objectFromID(objectID);
end;

SceneLib = _SceneLib;
return _SceneLib;
