# LuaTypeFramework
TypeFramework is a framework that helps you to have a more organized code, and more beautiful with functionalities that the pure Lua don't have!

Based on C/C++ syntax

Here goes the skeleton of a Lua TypeFramework code:
```lua
local TypeFramework = require('TypeFramework')
TypeFramework:Load()

LoadPackage('util.lua') -- Load "util.lua", is basically the "stdio.h" of Lua // not finished yet, future updates upcoming

function main()
  printf('Hello, world!')
end

TypeFramework:Init()
```
