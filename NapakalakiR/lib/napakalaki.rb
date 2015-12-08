# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'player'
require_relative 'combat_result'
require_relative 'treasure'
require_relative 'monster'
require_relative 'card_dealer'
require_relative 'combat_result'

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

    # Comprueba si el jugador activo cumple con las reglas del juego
    # para poder terminar su turno.
    # Devuelve false si el jugador activo no puede pasar de turno y 
    # true en caso contrario. Si currentPlayer es null, devuelve true
    def next_turn_allowed
      if(@currentPlayer == nill)
            return true;
      end
        return @currentPlayer.valid_state
    end
    
    
    # Se asigna un enemigo a cada jugador. Esta asignación se hace de forma aleatoria teniendo
    # en cuenta que un jugador no puede ser enemigo de sí mismo
    def set_enemies
      # Variable para saber si ya está asignado
      asignado = false
      
      for i in 0..@players.length-1
        while(!asignado)
          # Numero del enemigo
          pos_enemy = rand(0...@players.length)
          if( i != pos_enemy)
            @players[i].emeny(@players[pos_enemy])
            asignado = true
          end
          
        end
        asignado = false
      end
      
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
    
    
    # Devuelve true si el parametro resutl es WINGAME, en caso contrario devuelve false
    def end_of_game(result)
      return (result == CombatResult::WINGAME);
    end
    
    private :init_players, :next_player, :next_turn_allowed, :set_enemies
    
  end
end
