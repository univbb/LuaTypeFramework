--[[
  @name util.lua
  @author univb
  @since September 30th, 2020
  @desc A library based on "stdio.h" for "TypeFramework" on lua

  @version 0.0.1
]]

local str_lib = string
local util = {LoadForEnvironment = true}

function util.printf(str, ...)
  assert(str, 'str did\'t exists!')
  assert(type(str) == 'string', 'str must be a string!')
  
  print(str_lib.format(str, ...))
end

function util.sum(num1, num2)
  assert(num1, 'num1 did\'t exists!')
  assert(type(num1) == 'number', 'num1 must be a number!')
  assert(num2, 'num2 did\'t exists!')
  assert(type(num2) == 'number', 'num2 must be a number!')

  return num1 + num2
end

return util
