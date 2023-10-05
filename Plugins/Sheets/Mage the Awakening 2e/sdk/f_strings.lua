-- f_strings.lua ---
unpack = table.unpack or unpack

--------------------------------------------------------------------------------
-- Escape special pattern characters in string to be treated as simple characters
--------------------------------------------------------------------------------

local
function escape_magic(s)
  local MAGIC_CHARS_SET = '[()%%.[^$%]*+%-?]'
  if s == nil then return end
  return (s:gsub(MAGIC_CHARS_SET,'%%%1'))
end

--------------------------------------------------------------------------------
-- Returns iterator to split string on given delimiter (multi-space by default)
--------------------------------------------------------------------------------

function string:gsplit(delimiter)
  if delimiter == nil then return self:gmatch '%S+' end --default delimiter is any number of spaces
  if delimiter == '' then return self:gmatch '.' end
  if type(delimiter) == 'number' then   --break string in equal-size chunks
    local index = 1
    local ans
    return function()
             ans = self:sub(index,index+delimiter-1)
             if ans ~= '' then
               index = index + delimiter
               return ans
             end
           end
  end
  if self:sub(-#delimiter) ~= delimiter then self = self .. delimiter end
  return self:gmatch('(.-)'..escape_magic(delimiter))
end

--------------------------------------------------------------------------------
-- Split a string on the given delimiter (comma by default)
--------------------------------------------------------------------------------

function string:split(delimiter,tabled)
  tabled = tabled or false              --default is unpacked
  local ans = {}
  for item in self:gsplit(delimiter) do
    ans[#ans+1] = item
  end
  if tabled then return ans end
  return unpack(ans)
end

--------------------------------------------------------------------------------

function copy(t)              --returns a simple (shallow) copy of the table
  if type(t) == 'table' then
    local ans = {}
    for k,v in next,t do ans[ k ] = v end
    return ans
  end
  return t
end

--------------------------------------------------------------------------------

function eval(expr,vars)
  --evaluate a string expression with optional variables
  if expr == nil then return end
  vars = vars or {}
  assert(type(expr) == 'string','String expected as 1st arg')
  assert(type(vars) == 'table','Variable table expected as 2nd arg')
  local env = {abs=math.abs,acos=math.acos,asin=math.asin,atan=math.atan,
               atan2=math.atan2,ceil=math.ceil,cos=math.cos,cosh=math.cosh,
               deg=math.deg,exp=math.exp,floor=math.floor,fmod=math.fmod,
               frexp=math.frexp,huge=math.huge,ldexp=math.ldexp,log=math.log,
               max=math.max,min=math.min,modf=math.modf,pi=math.pi,pow=math.pow,
               rad=math.rad,random=math.random,randomseed=math.randomseed,
               sin=math.sin,sinh=math.sinh,sqrt=math.sqrt,tan=math.tan,
               tanh=math.tanh}
  for name,value in pairs(vars) do env[name] = value end
  local a,b = pcall(load('return '..expr,nil,'t',env))
  if a == false then return nil,b else return b end
end

--------------------------------------------------------------------------------
-- f'' formatted strings like those introduced in Python v3.6
-- However, you must use Lua style format modifiers as with string.format()
--------------------------------------------------------------------------------

function f(s)
  local env = copy(_ENV)                --start with all globals
  local i,k,v,fmt = 0
  repeat
    i = i + 1
    k,v = debug.getlocal(2,i)           --two levels up (1 level is this repeat block)
    if k ~= nil then env[k] = v end
  until k == nil
  local
  function go(s)
    local fmt
    s,fmt = s:sub(2,-2):split('::')
    if s:match '%b{}' then s = (s:gsub('%b{}',go)) end
    s = eval(s,env)
    if fmt ~= nil then
      if fmt:match '%b{}' then fmt = eval(fmt:sub(2,-2),env) end
      s = fmt:format(s)
    end
    return s
  end
  return (s:gsub('%b{}',go))
end