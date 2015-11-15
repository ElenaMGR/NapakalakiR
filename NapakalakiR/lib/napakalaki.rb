# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'singleton'

module NapakalakiGame
  
  class Napakalaki
    attr_reader :currentPlayer, :currentMonster 
    
    include Singleton
    
    # Atributos
    @dealer = CardDealer.instance
    @players = Array.new
    
    
    private
    def init_players(name)
      
    end
    
    private
    def next_player
      
      return Player;
    end
    
    private
    def next_turn_allowed
      
      return false;
    end
    
    private
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
      return false;
    end
    
    def end_of_game(result)
      return false;
    end
     
    
  end
end
