# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'singleton'

module NapakalakiGame

  class CardDealer
    
    include Singleton
    
    @unusedMonsters = Array.new
    
    @usedMonsters = Array.new
    @usedTreasures = Array.new
    @unusedTreasures = Array.new
    
    
    def init_treasure_card_deck
      
    end
    
    def init_monster_card_deck
      
    end
    
    def shuffle_treasure
      
    end

    def shuffle_monster
      
    end
    
    def next_treasure
      
    end
    
    def next_monster
      
    end
    
    def give_treasure_back
      
    end
    
    def give_monster_back
      
    end
    
    def init_cards
      
    end
    
    
  end

end