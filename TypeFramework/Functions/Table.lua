return function(x, y) 
  assert(type(y) == 'table', 'Value must be a table!') 
  getfenv(0)[x] = y 
  return y 
end