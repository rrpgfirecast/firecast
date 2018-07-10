require("vhd.lua")

local globalTable = _G;
local standardGlobalVariables = {};


local deprecatedGlobalVariablesArray = {"vhd", "rrpg", "ndb", "RRPG"};
local deprecatedGlobalVariablesDict = {};

for i = 1, #deprecatedGlobalVariablesArray, 1 do
	deprecatedGlobalVariablesDict[deprecatedGlobalVariablesArray[i]] = true;
end;

if type(globalTable) == "table" then
	for k, v in pairs(globalTable) do
		if not deprecatedGlobalVariablesDict[k] then
			standardGlobalVariables[#standardGlobalVariables + 1] = tostring(k);
		end;
	end;
end;


local luacheck_dir_prefix = "res://tools/LuaCheck/src/";

local aliases = {
      luacheck = luacheck_dir_prefix .. "init.lua",
      ["luacheck.argparse"] = luacheck_dir_prefix .. "argparse.lua",
      ["luacheck.builtin_standards"] = luacheck_dir_prefix .. "builtin_standards.lua",
      ["luacheck.cache"] = luacheck_dir_prefix .. "cache.lua",
      ["luacheck.check"] = luacheck_dir_prefix .. "check.lua",
      ["luacheck.config"] = luacheck_dir_prefix .. "config.lua",
      ["luacheck.core_utils"] = luacheck_dir_prefix .. "core_utils.lua",
      ["luacheck.detect_bad_whitespace"] = luacheck_dir_prefix .. "detect_bad_whitespace.lua",
      ["luacheck.detect_cyclomatic_complexity"] = luacheck_dir_prefix .. "detect_cyclomatic_complexity.lua",
      ["luacheck.detect_globals"] = luacheck_dir_prefix .. "detect_globals.lua",
      ["luacheck.detect_uninit_access"] = luacheck_dir_prefix .. "detect_uninit_access.lua",
      ["luacheck.detect_unreachable_code"] = luacheck_dir_prefix .. "detect_unreachable_code.lua",
      ["luacheck.detect_unused_locals"] = luacheck_dir_prefix .. "detect_unused_locals.lua",
      ["luacheck.detect_unused_rec_funcs"] = luacheck_dir_prefix .. "detect_unused_rec_funcs.lua",
      ["luacheck.expand_rockspec"] = luacheck_dir_prefix .. "expand_rockspec.lua",
      ["luacheck.filter"] = luacheck_dir_prefix .. "filter.lua",
      ["luacheck.format"] = luacheck_dir_prefix .. "format.lua",
      ["luacheck.fs"] = luacheck_dir_prefix .. "fs.lua",
      ["luacheck.globbing"] = luacheck_dir_prefix .. "globbing.lua",
      ["luacheck.inline_options"] = luacheck_dir_prefix .. "inline_options.lua",
      ["luacheck.lexer"] = luacheck_dir_prefix .. "lexer.lua",
      ["luacheck.lfs_fs"] = luacheck_dir_prefix .. "lfs_fs.lua",
      ["luacheck.linearize"] = luacheck_dir_prefix .. "linearize.lua",
      ["luacheck.love_standard"] = luacheck_dir_prefix .. "love_standard.lua",
      ["luacheck.lua_fs"] = luacheck_dir_prefix .. "lua_fs.lua",
      ["luacheck.main"] = luacheck_dir_prefix .. "main.lua",
      ["luacheck.name_functions"] = luacheck_dir_prefix .. "name_functions.lua",
      ["luacheck.multithreading"] = luacheck_dir_prefix .. "multithreading.lua",
      ["luacheck.ngx_standard"] = luacheck_dir_prefix .. "ngx_standard.lua",
      ["luacheck.options"] = luacheck_dir_prefix .. "options.lua",
      ["luacheck.parser"] = luacheck_dir_prefix .. "parser.lua",
      ["luacheck.resolve_locals"] = luacheck_dir_prefix .. "resolve_locals.lua",
      ["luacheck.runner"] = luacheck_dir_prefix .. "runner.lua",
      ["luacheck.standards"] = luacheck_dir_prefix .. "standards.lua",
      ["luacheck.utils"] = luacheck_dir_prefix .. "utils.lua",
      ["luacheck.version"] = luacheck_dir_prefix .. "version.lua"
   }

VHD.registerAlias(aliases);

local luacheck = require("luacheck");

local function createLuaCheckOptions(lintOptions)
	if type(lintOptions) ~= "table" then
		lintOptions = {};
	end;
	
	local luaCheckOptions = {};	
	
	if lintOptions.isSDK then
		luaCheckOptions.globals = standardGlobalVariables;
		luaCheckOptions.read_globals = {};
		luaCheckOptions.not_globals = {};
	else
		luaCheckOptions.globals = {};
		luaCheckOptions.read_globals = standardGlobalVariables;
		luaCheckOptions.not_globals = deprecatedGlobalVariablesArray;
	end;

	luaCheckOptions.max_line_length = 200;
	luaCheckOptions.max_code_line_length = 200;
	luaCheckOptions.max_string_line_length = 200;
	luaCheckOptions.max_comment_line_length = 200;
	
	if type(lintOptions.globals) == "table" then
		for i = 1, #lintOptions.globals, 1 do
			luaCheckOptions.globals[#luaCheckOptions.globals + 1] = lintOptions.globals[i] ;
		end;
	end;
	

	luaCheckOptions.ignore = {"611", "612", "614", "613", "621", 
							  "212", "213"};
	return luaCheckOptions;
end;


function LUACHECK_Content(scriptContent, scriptName, lintOptions)
	if type(lintOptions) ~= "table" then
		lintOptions = {};
	end;

	local options = createLuaCheckOptions(lintOptions);
		
	
	local reports = luacheck.get_report(scriptContent);
	local processedReports = luacheck.process_reports({reports}, options);
	
	local ret = {};
	local entries = processedReports[1];
	local filtredEntries = {};
	
	for i = 1, #entries, 1 do
		local entry = entries[i];
		local filtered = true;	
		
		entry.__msg = luacheck.get_message(entry);

		if lintOptions.ignoreSelfShadowing and (entry.code == "431") and (entry.name == "self") then
			filtered = false;
		end;
		
		if filtered then
			filtredEntries[#filtredEntries + 1] = entry;
		end;
	end;
	
	ret.entries = filtredEntries;
	return ret;
end;

function LUACHECK_MultipleFilesContent(sourcesArr, lintOptions)
	if type(lintOptions) ~= "table" then
		lintOptions = {};
	end;
	
	assert(type(sourcesArr) == "table");

	local sourcesStringArray = {};
	local optionsArray = {};
	
	for i = 1, #sourcesArr, 1 do
		sourcesStringArray[#sourcesStringArray + 1] = sourcesArr[i].content or "";
		
		lintOptions.isSDK = sourcesArr[i].isSDK; 
		optionsArray[#optionsArray + 1] = createLuaCheckOptions(lintOptions); 
	end;
	
	local processedReports = luacheck.check_strings(sourcesStringArray, optionsArray);		

	
	local ret = {};
	
	for i = 1, #sourcesArr, 1 do
		local sourceRet = {};
		local entries = processedReports[i];					
		local filtredEntries = {};
		
		assert(type(entries) == "table");	

		for j = 1, #entries, 1 do
			local entry = entries[j];
			local filtered = true;	
			
			entry.__msg = luacheck.get_message(entry);

			if sourcesArr[i].ignoreSelfShadowing and (entry.code == "431") and (entry.name == "self") then
				filtered = false;
			end;
			
			if filtered then
				filtredEntries[#filtredEntries + 1] = entry;
			end;		
		end;
				
		sourceRet.entries = filtredEntries;		
		ret[#ret + 1] = sourceRet;
	end;
	
	return ret;
end;
