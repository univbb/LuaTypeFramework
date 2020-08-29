return function(x, y) 
  assert(type(y) == 'string', 'Value must be a string!') 
  getfenv(0)[x] = y 
  return y 
end