# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  class CultistPlayer < Player
    
    @@totalCultistPlayers = 0
    
    def initialize(p,c)
      super(p)
      @myCultistCard = c
      @@totalCultistPlayers += 1
    end
    
    def getCombatLevel
      combatL = super
      combatL += combatL*0.2 + @myCultistCard.getGainedLevels * @@totalCultistPlayers 
      return combatL.floor
    end
    
    def getOponentLevel(m)
      return m.getCombatLevelAgainstCultistPlayer
    end
    
    def shouldConvert
      return false
    end
    
    def giveMeATreasure
      visibleT = getVisibleTreasures
      # Genero un número aletorio
      num = rand(0...visibleT.length)
      # Elijo el tesoro a devolver
      tesoro = visibleT.at(num)
      #Elimino el tesoro
      discardVisibleTreasure(tesoro)
      return tesoro
    end
    
    def canYouGiveMeATreasure
      return !(getHiddenTreasures.empty?)
    end
    
    def getTotalCultistPlayers
      return @@totalCultistPlayers
    end
    
    
    def to_s
      "Jugador Sectario: " + super
    end
    
    private :giveMeATreasure, :canYouGiveMeATreasure
    protected :getOponentLevel, :getCombatLevel, :shouldConvert
    
  end
end
