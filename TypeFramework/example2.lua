local TypeFramework = require('TypeFramework')
TypeFramework:Load()

LoadPackage('util.lua') -- load "util.lua"

int('X_0', 10) -- int variable
int('X_1', 1) -- int variable
int('res', sum(X_0, X_1)) -- "sum" is a function of "util.lua"

function main()
  printf('%d + %d = %d', X_0, X_1, res) -- prints the result
  -- "printf" is a function of "util.lua"
end

TypeFramework:Init()