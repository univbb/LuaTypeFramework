local TypeFramework = require('TypeFramework')
TypeFramework:Load()

LoadPackage('util.lua') --> load "util.lua"

Int('TestValue', 0)

function main()
  --> try catch example

  -- <> => required 
  -- [] => optional

  -- Try(function <f1>, function [f2] [err])
  Try(function() 
    TestValue = sum(nil, 20)
  end, function(err) 
    print('A error happened!')
    print(err)
  end)
end

TypeFramework:Init()
