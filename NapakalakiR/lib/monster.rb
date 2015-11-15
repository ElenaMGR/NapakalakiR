# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  

  class Monster
    # Modificadores de Acceso
    attr_reader :name
    attr_reader :combatLevel
    attr_reader :badConsequence
   
    def initialize(n,l,b,p)
      @name = n
      @combatLevel = l
      @badConsequence = b
      @prize = p    
    end
    
    def getLevelGained
      return prize.levels      
    end
    
    def getTreasureGained
      return prize.treasures      
    end
    
    def to_s
      "Nombre: #{@name}, CombatLevel: #{@combatLevel} \n  #{@badConsequence.to_s},\n  #{@prize.to_s}"
    end
  end


end