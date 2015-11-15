# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


module NapakalakiGame
  
  class Player
    attr_accesor :name, :level, :dead, :canISteal, :hiddenTreasures, :visibleTreasures
    attr_writer :enemy
  
    @@MAXLEVEL = 10
  
    @pendingBadConsequence
     
    def initialize (name)
      @name = name
      @dead = true
      @canISteal = true
    end
    
    
    
  end

end
