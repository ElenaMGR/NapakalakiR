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
      
    end
    
    def getOponentLevel(m)
      
    end
    
    def shouldConvert
      return false
    end
    
    def giveMeATreasure
      
    end
    
    def canYouGiveMeATreasure
      
    end
    
    def getTotalCultistPlayers
      return @@totalCultistPlayers
    end
    
    
    private :giveMeATreasure, :canYouGiveMeATreasure
    protected :getOponentLevel, :getCombatLevel, :shouldConvert
    
  end
end
