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
    
    def getCurrentPlayer      
        return @currentPlayer;
    end
    
    # Devuelve el mostrue en juego
    def getCurrentMonster
      return @currentMonster;
    end
   
    
    
    # Inicializa el array de jugadores, creando tantos jugadores como
    # elementos hay en names
    def initPlayers(name)
      name.each { |n| 
        p = Player.new(n)
        @players<<p
      }
    end
    
    # Decide qué jugador es el siguiente en jugar
    def nextPlayer
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
    def nextTurnAllowed
      if(@currentPlayer == nill)
            return true;
      end
        return @currentPlayer.validState
    end
    
    
    # Se asigna un enemigo a cada jugador. Esta asignación se hace de forma aleatoria teniendo
    # en cuenta que un jugador no puede ser enemigo de sí mismo
    def setEnemies
      # Variable para saber si ya está asignado
      asignado = false
      
      for i in 0..@players.length-1
        while(!asignado)
          # Numero del enemigo
          pos_enemy = rand(0...@players.length)
          if( i != pos_enemy)
            @players[i].setEnemy(@players[pos_enemy])
            asignado = true
          end
          
        end
        asignado = false
      end
      
    end
    
    def developCombat
      
    end
    
    def discardVisibleTreasures(treasures)
      
    end
    
    def discardHiddenTreasures(treasures)
      
    end
    
    def makeTreasuresVisible(treasures)
      
    end
    
    #
     # Se encarga de solicitar a CardDealer la inicializacion de los mazos
     # de cartas de Tesoros y de Monstruos, de inicializar los jugadores
     # proporcionandoles un nombre, asignarle a cada jugador su enemigo y de 
     # iniciar el juego con la llamada nextTurn() para pasar al siguiente
     # turno.
     # @param players 
     #
    def initGame(players)
      initPlayers(players)
      setEnemies     
      dealer.initCards
      nextTurn
    end
    
    
    #
     # Usa el método nextTurnAllowed(), donde se verifíca si el jugador activo 
     # cumple con las reglas del juego para poder terminar su turno.
     # En caso de que nextTurnAllowed devuelva true, se le solicita a CardDeale el
     # siguiente monstruo al que se enfrentará ese jugador y se actualiza el jugador activo
     # al siguiente jugador.
     # En caso de que el nuevo jugador activo esté muerto, por el combate en su anterior turno o 
     # porque es el primer turno, se inicilian sus tesoros siguiendo las reglas del juego.
     # @return devuelve nextTurnAllowed()
     #
    def nextTurn
      stateOK = nextTurnAllowed
       if (stateOK)
            @currentMonster = dealer.nextMonster
            @currentPlayer = nextPlayer
            dead = currentPlayer.isDead
            
            if (dead)
                @currentPlayer.initTreasures
            end
       end
        
        return stateOK;
    end
    
    
    # Devuelve true si el parametro resutl es WINGAME, en caso contrario devuelve false
    def endOfGame(result)
      return (result == CombatResult::WINGAME);
    end
    
    private :initPlayers, :nextPlayer, :nextTurnAllowed, :setEnemies
    
  end
end
