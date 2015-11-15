# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'player'
require_relative 'combat_result'
require_relative 'treasure'
require_relative 'monster'
require_relative 'card_dealer'

require 'singleton'

module NapakalakiGame
  
  class Napakalaki
    attr_reader :currentPlayer, :currentMonster 
    
    include Singleton
    
    # Atributos
    @dealer = CardDealer.instance
    @players = Array.new
    
    
    def init_players(name)
      
    end
    
    def next_player
      
    end
    
    def next_turn_allowed

    end
    
    def set_enemies
      
    end
    
    def develop_combat
      
    end
    
    def discard_visible_treasures(treasures)
      
    end
    
    def discard_hidden_treasures(treasures)
      
    end
    
    def make_treasures_visible(treasures)
      
    end
    
    def init_game(players)
      
    end
    
    def next_turn
      
    end
    
    def end_of_game(result)
      
    end
    
    private :init_players, :next_player, :next_turn_allowed, :set_enemies
    
  end
end
