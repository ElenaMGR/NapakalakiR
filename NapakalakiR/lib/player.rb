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
    
    private
    def bring_to_life
      
    end
    
    private 
    def get_combat_level
      
    end
    
    private
    def increment_levels (l)
      
    end
    
    private
    def decrement_levels (l)
      
    end
    
    private
    def set_pending_bad_consequence (b)
      
    end
    
    private
    def apply_prize (m)
      
    end
    
    private 
    def apply_bad_consequence (m)
      
    end
    
    private
    def can_make_treasure_visible (t)
      
    end
    
    private
    def how_many_visible_treasures (tKind)
      
    end
    
    private
    def die_if_no_treasures
      
    end
    
  end

end
