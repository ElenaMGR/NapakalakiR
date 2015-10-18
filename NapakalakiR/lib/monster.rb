# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Monster
  # Modificadores de Acceso
  attr_reader :name
  attr_reader :combatlevel
  attr_reader :bc
  attr_reader :prize
  
  def initialize(name,combatlevel,bc,prize)
    @name = name
    @combatlevel = combatlevel
    @bc = bc
    @prize = prize    
  end
end
