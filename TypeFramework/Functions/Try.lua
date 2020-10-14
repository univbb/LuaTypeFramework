return function(f1, f2)
  local success, err = xpcall(f1)

  if(not success) then f2(err) end
end