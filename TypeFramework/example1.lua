--> Example1 of TypeFramework!

local TypeFramework = require('TypeFramework')
TypeFramework:Load()

-- Variables
Int('Val', 10) -- > int variable
String('Hello', 'Hi') --> string variable
Table('A', {1, 2, 3}) --> table variable

-- DataTypes
TypeFramework:NewType('PlayerData') --> custom datatype

-- Classes
Class('Player', {
  constructor = function(self, name)

    self.Name = name
    self._Backpack = {}

    return self

  end,

  public = {
    Name = 'Player',
    
    GetName = function(self)
      return self.Name
    end,
    SetName = function(self, name)
      self.Name = name
    end,

    AddItem = function(self, object)
      table.insert(self._Backpack, object)
    end
  },
  private = {_Backpack = {}},
  static = {
    newFromBackpack = function(self, backpack)

      self._Backpack = backpack

      return self
    end
  }
})

-- Main
function main()
  process.utils.log('Hello, world!')
  process.utils.log(Val) --> 10
  process.utils.log(Hello) --> "Hi"

  PlayerData('object', Player('Player1')) --> instantiating a player using the "PlayerData" custom datatype
  local object2 = Player.newFromBackpack({

  })

  process.utils.log(object.Name) --> "Player1"
  process.utils.log(object2.Name) --> "Player"

  --> switch case demo
  print()
  print('Switch case:')
  Switch(1 == 1 --[[ << Condition ]], {
    {true, function() print('True!') end}, --> case true, prints "True!"
    {false, function() print('False!') end} --> case false, prints "True!"
  })
end

TypeFramework:Init()