# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


require_relative 'prize'
require_relative 'bad_consequence'

module NapakalakiGame
  

  class Monster
    # Modificadores de Acceso
    attr_reader :name
    attr_reader :combatLevel
    attr_reader :badConsequence
   
    def initialize(n,l,b,p,ic=nil)
      @name = n
      @combatLevel = l
      @badConsequence = b
      @prize = p    
      if ic.nil?
        @levelChangeAgainstCultistPlayer = 0
      else
        @levelChangeAgainstCultistPlayer = ic
      end
      
    end
    
    # Métodos get
    def getName
        return @name;
    end

    def getCombatLevel
        return @combatLevel;
    end
    
    def getBadConsequence
        return @badConsequence;
    end
    
    
    # Devuelve el número de niveles ganados proporcionados por su buen rollo
    def getLevelsGained
      return @prize.levels      
    end
    
    # Devuelve el número de tesoros ganados proporcionados por su buen rollo
    def getTreasuresGained
      return @prize.treasures      
    end
    
    def getCombatLevelAgainstCultistPlayer
      return (@combatLevel + @levelChangeAgainstCultistPlayer)
    end
    
    def to_s
      "Monster: #{@name} \t CombatLevel: #{@combatLevel} \n"+
      "   #{@prize.to_s}  #{@badConsequence.to_s}  \n"
    end
  end


end