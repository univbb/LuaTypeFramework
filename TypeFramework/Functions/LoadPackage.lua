return function(packageName) 
  assert(type(packageName) == 'string', 'Package name! must be a string!') 
  local success = pcall(function() 
    if(packageName:find('.lua')) then packageName = packageName:gsub('.lua', '') end
    local pack = require('./Packages/' .. packageName)
  end)

  if(success) then
    local pack = require('Packages.' .. packageName)
    if(pack.LoadForEnvironment) then
      for k,v in pairs(pack) do
        if(type(v) == 'function') then
          getfenv(0)[k] = v
        end
      end
    end

  end
end