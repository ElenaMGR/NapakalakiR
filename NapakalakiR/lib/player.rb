# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'combat_result'
require_relative 'card_dealer'
require_relative 'treasure'
require_relative 'dice'
require_relative 'treasure_kind'
require_relative 'monster'
require_relative 'bad_consequence'

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
      @level = 0
      @hiddenTreasures = Array.new
      @visibleTreasures = Array.new
    end
    
    # Devuelve la vida al jugador, modificando el atributo correspondiente
    def bring_to_life
      @dead = false
    end

    # Devuelve el nivel de combate del jugador. Que viene dado por
    # su nivel más los bonus que le proporcionan los tesoros que
    # tenga equipados
    def get_combat_level
      combat_level=@level
      hiddenTreasures.each { |ht|
        combat_level += ht.bonus
      }
      return combat_level
 
    end
    
    #Incrementa el nivel del jugador en i niveles
    def increment_levels (l)
      @level += l
    end
    
    # Decrementa el nivel del jugador en i niveles
    def decrement_levels (l)
      @level -= l
    end
    
    # Asigna el mal rollo al jugador
    def set_pending_bad_consequence (b)
      @pendingBadConsequence = b
    end
    
    def apply_prize (m)
      
    end
    
    def apply_bad_consequence (m)
      
    end
    
    def can_make_treasure_visible (t)
      
    end
    
    #Devuelve el número de tesoros visibles de tipo tKind que tiene el jugador
    def how_many_visible_treasures (tKind)
      num=0
      @visibleTreasures.each { |v| 
        if (v.type==tKind)
          num+=1
        end
      }
      return num
    end
    
    # Cambia el estado de jugador a muerto, modificando el correspondiente
    # atributo.
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
    
    
    # Devuelve true cuando el jugador no tiene ningún mal rollo que cumplir
    # y no tiene más de 4 tesoros  ocultos, y false en caso contrario.
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
    
    def give_me_a_treasure
      
    end
    
    # Devuelve true si el jugador tiene tesoros para ser robados
    # por otro jugador y false en caso contrario.
    def can_you_give_me_a_treasure
      if (@hiddenTreasures.size>0)
        return true
      end
      return false
    end
    
    
    # Cambia el atributo canISteal a false cuando el jugador roba un tesoro
    def have_stolen
      @canISteal=false
    end
    
    def discard_all_treasures
      
    end
    
    
    private :bring_to_life, :get_combat_level, :increment_levels, :decrement_levels
    private :set_pending_bad_consequence, :apply_prize, :apply_bad_consequence
    private :can_make_treasure_visible, :how_many_visible_treasures, :die_if_no_treasures
    private :give_me_a_treasure, :can_you_give_me_a_treasure, :have_stolen
     
  end

end
