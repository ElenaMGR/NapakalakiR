# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


module NapakalakiGame
  
  class Player
    attr_reader :name, :level, :dead, :canISteal, :hiddenTreasures, :visibleTreasures
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
      @dead = false
    end
    
    private 
    def get_combat_level
      combat_level=@level
      hiddenTreasures.each { |ht|
        combat_level += ht.bonus
      }
      return combat_level
 
    end
    
    private
    def increment_levels (l)
      @level += l
    end
    
    private
    def decrement_levels (l)
      @level -= l
    end
    
    private
    def set_pending_bad_consequence (b)
      @pendingBadConsequence = b
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
      num=0
      @visibleTreasures.each { |v| 
        if (v.type==tKind)
          num+=1
        end
      }
      return num
    end
    
    private
    def die_if_no_treasures
      if (@hiddenTreasures.empty? && @visibleTreasures.empty?)
        @dead = true
      end
    end
    
    def combat (m)
      
    end
    
    def make_treasure_visible (t)
      
    end
    
    def discard_visible_treasure (t)
      
    end
    
    def discard_hidden_treasure (t)
      
    end
    
    def valid_state
      if (@pendingBadConsequence.is_empty && !(@hiddenTreasures.size>4))
          return true
      end
      return false
    end
    
    def init_treasures
      
    end
    
    def steal_treasure
      
    end
    
    private 
    def give_me_a_treasure
      
    end
    
    private 
    def can_you_give_me_a_treasure
      if (@hiddenTreasures.size>0)
        return true
      end
      return false
    end
    
    private
    def have_stolen
      @canISteal=false
    end
    
    def discard_all_treasures
      
    end
    
     
  end

end
