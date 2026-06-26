local rrpg = require("rrpg.lua");
local plugins = require("delayedLoad.dlua").new("pluginsCore.dlua");

rrpg.plugins = plugins;
rrpg.Plugins = plugins;
return plugins;
