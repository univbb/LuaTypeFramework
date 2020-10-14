return function(cond, cases)
  for _,case in next, cases do
    if(type(case) == 'table') then
      if(case[1] and case[2]) then
        if(type(case[2]) == 'function') then
          if(cond == case[1]) then
            case[2]()
            break
          end
        end
      end
    end
  end
end 