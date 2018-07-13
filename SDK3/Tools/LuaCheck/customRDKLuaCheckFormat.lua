local luacheck = require("luacheck");

local customRDKFormat = {};



local function suffix_if_indirect(fmt)
   return function(w)
      if w.indirect then
         return fmt .. ".indirectly"
      else
         return fmt
      end
   end
end

local function unused_or_overwritten(fmt)
   return function(w)
      if w.overwritten_line then
         return fmt .. ".overwritten"
      else
         return fmt .. ".unused"
      end
   end
end

local message_formats = {
   ["011"] = "luacheck.translated.direct",
   ["021"] = "luacheck.translated.direct",
   ["022"] = "luacheck.translated.022",
   ["023"] = "luacheck.translated.023",
   ["111"] = function(w)
      if w.module then
         return "luacheck.translated.111_module"
      else
         return "luacheck.translated.111_non_module"
      end
   end,
   ["112"] = "luacheck.translated.112",
   ["113"] = "luacheck.translated.113",
   ["121"] = "luacheck.translated.121",
   ["122"] = suffix_if_indirect("luacheck.translated.122"),
   ["131"] = "luacheck.translated.131",
   ["142"] = suffix_if_indirect("luacheck.translated.142"),
   ["143"] = suffix_if_indirect("luacheck.translated.143"),
   ["211"] = function(w)
      if w.func then
         if w.recursive then
            return "luacheck.translated.211.func.recursive"
         elseif w.mutually_recursive then
            return "luacheck.translated.211.func.mutually_recursive"
         else
            return "luacheck.translated.211.func.std"
         end
      else
         return "luacheck.translated.211.variable"
      end
   end,
   ["212"] = function(w)
      if w.name == "..." then
         return "luacheck.translated.212.variable"
      else
         return "luacheck.translated.212"
      end
   end,
   ["213"] = "luacheck.translated.213",
   ["221"] = "luacheck.translated.221",
   ["231"] = "luacheck.translated.231",
   ["232"] = "luacheck.translated.232",
   ["233"] = "luacheck.translated.233",
   ["241"] = "luacheck.translated.241",
   ["311"] = unused_or_overwritten("luacheck.translated.311"),
   ["312"] = unused_or_overwritten("luacheck.translated.312"),
   ["313"] = unused_or_overwritten("luacheck.translated.313"),
   ["314"] = function(w)
      local target = w.index and lang("luacheck.translated.statement.index") or lang("luacheck.translated.statement.field")
	  
	  if w.rdk_target_str ~= target then
		w.rdk_target_str = target;
	  end;
	  
      return "luacheck.translated.314"
   end,
   ["321"] = "luacheck.translated.321",
   ["331"] = "luacheck.translated.331",
   ["341"] = "luacheck.translated.341",
   ["411"] = "luacheck.translated.411",
   ["412"] = "luacheck.translated.412",
   ["413"] = "luacheck.translated.413",
   ["421"] = "luacheck.translated.421",
   ["422"] = "luacheck.translated.422",
   ["423"] = "luacheck.translated.423",
   ["431"] = "luacheck.translated.431",
   ["432"] = "luacheck.translated.432",
   ["433"] = "luacheck.translated.433",
   ["511"] = "luacheck.translated.511",
   ["512"] = "luacheck.translated.511",
   ["521"] = "luacheck.translated.521",
   ["531"] = "luacheck.translated.531",
   ["532"] = "luacheck.translated.532",
   ["541"] = "luacheck.translated.541",
   ["542"] = "luacheck.translated.542",
   ["551"] = "luacheck.translated.551",
   ["561"] = function(w)
      local function_descr

      if w.function_type == "main_chunk" then
         function_descr = lang("luacheck.translated.statement.main_chunk")
      elseif w.function_name then
         return "luacheck.translated.561_function_type";
      else
         function_descr = lang("luacheck.translated.statement.function")
      end
	  
	  if w.rdk_function_descr ~= function_descr then
		w.rdk_function_descr = function_descr;
	  end;

      return "luacheck.translated.561";
   end,
   ["611"] = "luacheck.translated.611",
   ["612"] = "luacheck.translated.612",
   ["613"] = "luacheck.translated.613",
   ["614"] = "luacheck.translated.614",
   ["621"] = "luacheck.translated.621",
   ["631"] = "luacheck.translated.631"
}

local Locale = require("locale.lua");

local function get_message_format(warning)
   local message_format = message_formats[warning.code]

   local langMessageId;
   
   if type(message_format) == "function" then
      langMessageId = message_format(warning);
   else
      langMessageId = message_format;
   end
   
   return Locale.lang(langMessageId);    
end

local color_codes = {
   reset = 0,
   bright = 1,
   red = 31,
   green = 32
}

local function encode_color(c)
   return "\27[" .. tostring(color_codes[c]) .. "m"
end

local function colorize(str, ...)
   str = str .. encode_color("reset")

   for _, color in ipairs({...}) do
      str = encode_color(color) .. str
   end

   return encode_color("reset") .. str
end

local function substitute(string_format, values, color)
   return (string_format:gsub("{([_a-zA-Z0-9]+)(!?)}", function(field_name, highlight)
      local value = tostring(assert(values[field_name], "No field " .. field_name))

      if highlight == "!" then
         if color then
            return colorize(value, "bright")
         else
            return "'" .. value .. "'"
         end
      else
         return value
      end
   end))
end

local function format_message(event, color)
   return substitute(get_message_format(event), event, color)
end

function customRDKFormat.get_message(event)
   return format_message(event)
end;

return customRDKFormat;