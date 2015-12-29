# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  class Cultist
    
    
    def initialize(name,gainedlevel)
      @name = name
      @gainedLevels = gainedlevel
      
    end
    
    def getGainedLevels
      return @gainedLevels
    end
    
    
  end
end
