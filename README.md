# LuaTypeFramework
TypeFramework are a C++/C based syntax. It's a nice option if you like these languages

Here goes the skeleton of a Lua TypeFramework code:
```lua
local TypeFramework = require('TypeFramework')
TypeFramework:Load()

LoadPackage('util.lua') -- Load "util.lua", a TypeFramework library

function main()
  printf('Hello, world!')
end

TypeFramework:Init()
```
