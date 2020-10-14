--[[
  @name TypeFramework
    @author univb (twitter: @yeaimunivb)
    @since August 21, 2020
    @version 0.0.1
    
    @desc
      TypeFramework is a framework that helps you to have a more organized code, and more beuatiful with functionalities that the pure Lua don't have!
]]

--[[
  Required:
    lfs library installed
  Usage:
    local TypeFramework = require('TypeFramework') --> imports TypeFramework
    TypeFramework:Load() --> load all functions

    function main() --> the main function
      process.utils.log('Hello, world!') --> custom print
    end

    TypeFramework:Init() --> initializes all functions, and another things!

  Note: ALL the default lua functions is working on TypeFramework!
]]

require('lfs')
math.randomseed(os.time()+(os.clock()*1000))

local TypeFramework = {} do
  function TypeFramework:Init()

    local mainFound = false
    for k, v in next, getfenv(0) do
      if(k == 'main' and type(v) == 'function') then
        v()
        mainFound = true
        break
      end
    end

    if(not mainFound) then
      error('TypeFramework | Can\'t find main function!')
    end

  end

  function TypeFramework:Load()

    for file in lfs.dir(lfs.currentdir() .. [[\Functions]]) do
      pcall(function()
        if(file:match('.lua')) then
          file = file:gsub('.lua', '')
        end
        local f = require('Functions/' .. file)
        getfenv(0)[file] = f
        getfenv(0)[file:lower()] = f
      end)
    end

  end

  function TypeFramework:NewType(name)

    local Base = {}
    Base.__index = Base

    setmetatable(Base, {
      __call = function(cls, ...) 
        local self = setmetatable({}, cls)

        return self.new(...)
      end
    })

    function Base.new(var_name, value)
      if(type(var_name) ~= 'string') then print('TypeFramework | The variable name must be a string!') end
      
      getfenv(0)[var_name] = value or nil

      return x
    end

    getfenv(0)[name] = Base
    
  end
end

return TypeFramework