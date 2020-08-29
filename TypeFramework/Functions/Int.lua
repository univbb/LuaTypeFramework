return function(x, y) 
  assert(type(y) == 'number', 'Value must be a number!') 
  getfenv(0)[x] = y 
  return y 
end