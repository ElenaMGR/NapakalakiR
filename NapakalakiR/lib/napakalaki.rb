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
    
    
    # Inicializa el array de jugadores, creando tantos jugadores como
    # elementos hay en names
    def init_players(name)
      name.each { |n| 
        p = Player.new(n)
        @players<<p
      }
    end
    
    # Decide qué jugador es el siguiente en jugar
    def next_player
      if (@currentPlayer.name=="") # Si es la primera jugada
        nex = rand(0...@players.length)
      else
        nex = 0 
        for i in 0..@players.length
          
          if (@players[i].name==@currentPlayer.name)
            nex = (i + 1) % (@players.length)
          end
          
        end
      
      end
      
      return @players[nex]
 
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
