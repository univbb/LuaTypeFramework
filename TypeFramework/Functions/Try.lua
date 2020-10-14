return function(f1, f2)
  assert(f1, 'f1 didn\'t exists!')
  assert(type(f1) == 'function', 'f1 must be a function!')

  local success, err = pcall(function() f1() end)

  if(not success and f2) then
    assert(type(f2) == 'function', 'f2 must be a function!')
    f2(err) 
  end
end
