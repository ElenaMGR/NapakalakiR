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
    
    
    def initialize
      # Atributos
      @dealer = CardDealer.instance
      @players = Array.new
      @currentPlayer = Player.new("")
      @currentMonster = Monster.new("", 0, 0, 0)
    end
    
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
        @players << Player.new(n)
      }
    end
    
    # Decide qué jugador es el siguiente en jugar
    def nextPlayer
      if (@currentPlayer.getName=="") # Si es la primera jugada
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
      if(@currentPlayer.nil?)
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
    
    
    #
     # Pasa el control al jugador actual para que lleve a cabo el combate con el 
     # monstruo que le ha tocado.
     # @return CombatResult
     #
    def developCombat
      combatResult = @currentPlayer.combat(@currentMonster)
      @dealer.giveMonsterBack(@currentMonster)
      return combatResult
    end
    
    #
     # Elimina los tesoros visibles indicados en la lista de tesoros visibles
     # del jugador. Al eliminar esos tesoros se devuelven al mazo de tesoros.
     # @param treasures 
     #
    def discardVisibleTreasures(treasures)
      treasures.each{ |treasure|
            @currentPlayer.discardVisibleTreasure(treasure);
            @dealer.giveTreasureBack(treasure);
        }
    end
    
    
    #
     # Elimina los tesoros ocultos indicados en la lista de tesoros ocultos
     # del jugador. Al eliminar esos tesoros se devuelven al mazo de tesoros.
     # @param treasures 
     #
    def discardHiddenTreasures(treasures)
      treasures.each{ |treasure|
            @currentPlayer.discardHiddenTreasure(treasure);
            @dealer.giveTreasureBack(treasure);
        }
    end
    
    
    #
     # Se pide al jugador actual que pase tesoros ocultos a visibles.
     # @param treasures lista de tesoros que pasan de ocultos a visibles.
     #
    def makeTreasuresVisible(treasures)
      treasures.each{ |t|
        @currentPlayer.makeTreasureVisible(t)
      }  
        
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
      @dealer.initCards
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
            @currentMonster = @dealer.nextMonster
            @currentPlayer = nextPlayer
            dead = @currentPlayer.isDead
            
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
