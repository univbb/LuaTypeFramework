--[[
  @name TypeFramework
    @author univb (twitter: @yeaimunivb)
    @since August 21, 2020
    @version ALPHA 0.0.1
    
    @desc
      TypeFramework is a Lua framework with custom functions, object type system, variable type system and more things!
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

  Note: ALL the default lua functions is working on TypeFramework! You can use some functions of TypeFramework, but using another
  lua functions!
]]

require('lfs')
math.randomseed(os.time()+(os.clock()*1000))

local TypeFramework = {} do
  function TypeFramework:Init()

    for k, v in next, getfenv(0) do
      if(k == 'main' and type(v) == 'function') then
        v()
        break
      end
    end

  end

  function TypeFramework:Load()

    local Base = {
      process = {
        utils = {}
      }
    }
    local replacedFunctions = {
      require = {'include', 'import'}
    }

    function Base.process.utils.log(...)
      print(...)
    end

    function Base.process.utils.table_log(tab)
      for a, b in next, tab do
        print(a, b)
      end
    end

    for i, v in next, Base do
      getfenv(0)[i] = v
    end
    
    for i, v in next, replacedFunctions do
      local f = getfenv(0)[i] or nil 
      if(f) then
        for a, b in next, v do
          getfenv(0)[b] = function(...)
            return f(...)
          end
        end
      end
    end

    for file in lfs.dir(lfs.currentdir() .. [[\Functions]]) do
      pcall(function()
        if(file:match('.lua')) then
          file = file:gsub('.lua', '')
        end
        local f = require('Functions/' .. file)
        getfenv(0)[file] = f
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