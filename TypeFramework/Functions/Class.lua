return function(name, prop)
  local Public = prop.public or {}
  local Private = prop.private or {}
  local Static = prop.static or {}
  local Constructor =  prop.constructor or function() end
      
  local BaseClass = {}

  setmetatable(BaseClass, {
    __call = function(cls, ...)
      return setmetatable({}, {__index = cls}).new(...)
    end
  })
    
  function BaseClass.new(...)
        
    local t = {}
    for i, v in next, Public do t[i] = v end
    for i, v in next, Private do t[i] = v end
    
    local self = setmetatable({}, {__index = t})
    
    return Constructor(self, ...)
    
  end
    
  for i, v in next, Static do
    if(type(v) == 'function') then
      BaseClass[i] = function(...)

        local t = {}
        for i, v in next, Public do t[i] = v end
        for i, v in next, Private do t[i] = v end
        
        local self = setmetatable({}, {__index = t})

        return v(t, ...)

      end
    end
  end

  getfenv(0)[name] = BaseClass

  return BaseClass
end