local TypeFramework = require('TypeFramework')
TypeFramework:Load()

-- Variables
Int('Val', 10) -- > int variable
String('Hello', 'Hi') --> string variable

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

  local object = Player('Player1') --> or Player.new()!
  local object2 = Player.newFromBackpack({

  })

  process.utils.log(object.Name) --> "Player1"
  process.utils.log(object2.Name) --> "Player"
end

TypeFramework:Init()