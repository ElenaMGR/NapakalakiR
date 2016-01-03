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
    attr_reader :name, :level, :dead, :canISteal, :hiddenTreasures, :visibleTreasures, :pendingBadConsequence
    attr_writer :enemy
  
    @@MAXLEVEL = 10 
     
    def initialize (name)
      @name = name
      @dead = true
      @canISteal = true
      @level = 1
      @hiddenTreasures = Array.new
      @visibleTreasures = Array.new
      @pendingBadConsequence = BadConsequence.newLevelNumberOfTreasures("", 0, 0, 0)
    end
    
    def newPlayer(p)
      @name = p.getName
      @dead = p.isDeath
      @canISteal = p.canISteal
      @level = p.getLevels
      @hiddenTreasures = p.getHiddenTreasures
      @visibleTreasures = p.getVisibleTreasures
      @pendingBadConsequence = p.pendingBadConsequence
    end
    
    def getName
        return @name
    end
    
    # Metodo de clase que accede a la variabla MAXTREASURES
    def self.maxLevel
      @@MAXLEVEL
    end
    
    
    #Cambia el atributo canISteal a false cuando el jugador roba un tesoro. 
    def haveStolen
        @canISteal= false
    end
    
    def canISteal
        return @canISteal
    end
    
    def setEnemy(enemy)
        @enemy = enemy
    end
    
    def getEnemy
      return @enemy
    end
    
    def getLevels
        return @level
    end
    
    def isDead  
        return @dead
    end
    
    def getHiddenTreasures
        return @hiddenTreasures;
    end
    
    def getVisibleTreasures
        return @visibleTreasures;
    end
    
    # Devuelve la vida al jugador, modificando el atributo correspondiente
    def bringToLife
      @dead = false
    end

    # Devuelve el nivel de combate del jugador. Que viene dado por
    # su nivel más los bonus que le proporcionan los tesoros que
    # tenga equipados
    def getCombatLevel
      combat_level=@level
      @visibleTreasures.each { |ht|
        combat_level += ht.bonus
      }
      return combat_level
 
    end
    
    def getOponentLevel(m)
      return m.getCombatLevel
    end
    
 
    def shouldConvert
      d = Dice.instance
      n = d.nextNumber
      if (n==1)
        shouldC=true
      else
         shouldC=false
      end
      
      return shouldC
    end
 
    
    #Incrementa el nivel del jugador en i niveles
    def incrementLevels (l)
      @level += l
    end
    
    # Decrementa el nivel del jugador en i niveles
    def decrementLevels (l)
      if (@level-l<=0)
        @level=1
      else
        @level -= l
      end
    end
    
    # Asigna el mal rollo al jugador
    def setPendingBadConsequence (b)
      @pendingBadConsequence = b
    end
    

    # Aplica el buen rolloo del monstruo vencido al jugador, sumando los niveles
    # correspondientes y pidiendo al CardDealer que le dé el número de 
    # tesoros indicado en el buen rollo del monstruo. Esos tesoros se añaden
    # a sus tesoros
    # @param m Monstruo vencido   
    def applyPrize (m)
      nLevels = m.getLevelsGained
      incrementLevels(nLevels)
      nTreasures = m.getTreasuresGained
      if (nTreasures > 0)
        dealer = CardDealer.instance
            
        i = 0
        while (i < nTreasures)
          treasure = dealer.nextTreasure()
          @hiddenTreasures << treasure
          
          i+=1
        end
      end      
    end
    
    
    # Realiza el mal rollo de un monstruo contra el jugador.
    # Aplica las consecuencias que puede y las que no las guarda
    # en el mal rollo pendiente.
    # @param m monstruo con el que ha perdido
    def applyBadConsequence (m)
      badConsequence = m.getBadConsequence
      nLevels = badConsequence.getLevels
      decrementLevels(nLevels)
      pendingBad = badConsequence.adjustToFitTreasureList(@visibleTreasures, @hiddenTreasures)
      setPendingBadConsequence(pendingBad)
    end
    

    
    # Pasa un objeto oculto de la mano del jugador a visible.
    # @param t tesoro que se hace visible.
    def makeTreasureVisible (t)
      canI = canMakeTreasureVisible(t);
        if (canI)
            @visibleTreasures << t
            no_encontrado = true
            i = 0
            while( i < @hiddenTreasures.length && no_encontrado)
              if ( @hiddenTreasures.at(i) == t)
                no_encontrado = false
                @hiddenTreasures.delete_at(i)
              end
              i+=1
            end
        end
    end
    
    #Devuelve el número de tesoros visibles de tipo tKind que tiene el jugador
    def howManyVisibleTreasures (tKind)
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
    def dieIfNoTreasures
      if (@hiddenTreasures.empty? && @visibleTreasures.empty?)
        @dead = true
      end
    end
    
    #
     # Si el nivel de combate del jugador supera al del monstruo, se aplica el buen rollo 
     # y se puede ganar el combate o el juego, en otro caso, el jugador pierde el combate 
     # y se aplica el mal rollo correspondiente.
     # @param m Monstruo con el que combate
     # @return resultado del combate.
     #
    def combat (m)
      myLevel = getOponentLevel(m)
      monsterLevel = m.getCombatLevel
        
      if (myLevel>monsterLevel)
        applyPrize(m);
            
        if (@level>=@@MAXLEVEL)
          cr = CombatResult::WINGAME
        else
          cr = CombatResult::WIN
        end
      else
        applyBadConsequence(m)
        
        if(shouldConvert)
          cr = CombatResult.LOSEANDCONVERT
        else
          cr = CombatResult.LOSE 
        end
        
      end
        
      return cr
    end
    
    
    # Comprueba si el tesoro t se puede pasar de oculto a visible
    def canMakeTreasureVisible (t)
      sePuede = true
      # Solo podrá tener equipado un tesoro de cada tipo, 
      # salvo para el caso de tesoros de una mano de los
      # que podrá tener equipados hasta 2.
      oneHand=0
      bothhands=false
      i=0
      while (i < @visibleTreasures.size()  && sePuede)
        if (t.getType()!= TreasureKind::ONEHAND)
          # Si ya lo tiene equipado no se puede equipar
          if (t.getType()==@visibleTreasures.at(i).getType)
            sePuede=false;     
          end
          if (@visibleTreasures.at(i).getType==TreasureKind::ONEHAND)
            oneHand+=1;
          end
        else
          # Cuento cuantas armas de una mano tiene equipadas
          if (t.getType()==@visibleTreasures.at(i).getType)
            oneHand+=1;
          end
        end
        # Compruebo si tiene equipado un arma de dos manos     
        if (@visibleTreasures.at(i).getType==TreasureKind::BOTHHANDS)
          bothhands=true;
        end
             
        i+=1
      end
      
      if(sePuede)
        # Si se tienen equipado 1 ó 2 tesoros de una mano, no se podrá 
        # tener equipado ningún tesoro de dos manos. 
        if (oneHand>0 && (t.getType()== TreasureKind::BOTHHANDS))
          sePuede=false;

        # Si se tiene equipado un tesoro de dos manos, no se podrá tener 
        # equipado ningún tesoro de una mano.
        # Si el tipo es ONEHAND y ya tiene dos equipadas, no se puede
                        
        else 
          if(t.getType() == TreasureKind::ONEHAND)
            if(oneHand==2 || bothhands)
              sePuede=false;
            end
          end
        end
      end
      
      return sePuede
    end
    
    

    # Se elimina un tesoro visible.
    # Si tiene un mal rollo pendiente e implica eliminar un tesoro visible
    # se elimina del mal rollo tambien. Luego se comprueban si el jugador
    # esta vivo.
    # @param t tesoro que se va a descartar.
    def discardVisibleTreasure (t)
      no_encontrado = true
      i=0
      while (i < @visibleTreasures.length && no_encontrado)
        if (@visibleTreasures[i]==t)
          no_encontrado= false
          @visibleTreasures.delete_at(i)
        end
        i+=1
      end
      

      if( (!@pendingBadConsequence.nil?) && (!@pendingBadConsequence.isEmpty) )
            @pendingBadConsequence.substracVisibleTreasure(t);
      end
        
      dieIfNoTreasures
      
    end
    
    
    
    # Se elimina un tesoro oculto.
    # Si tiene un mal rollo pendiente e implica eliminar un tesoro oculto
    # se elimina del mal rollo tambien. Luego se comprueban si el jugador
    # esta vivo.
    # @param t tesoro que se va a descartar.
    def discardHiddenTreasure (t)
      no_encontrado = true
      i=0
      while (i < @hiddenTreasures.length && no_encontrado)
        if (@hiddenTreasures[i]==t)
          no_encontrado= false
          @hiddenTreasures.delete_at(i)
        end
        i+=1
      end
      
      
      if( (!@pendingBadConsequence.nil?) && (!@pendingBadConsequence.isEmpty) )
            @pendingBadConsequence.substracHiddenTreasure(t);
      end
        
      dieIfNoTreasures
    end
    
    
    # Devuelve true cuando el jugador no tiene ningún mal rollo que cumplir
    # y no tiene más de 4 tesoros  ocultos, y false en caso contrario.
    def validState
      if (@pendingBadConsequence.isEmpty && !(@hiddenTreasures.size>4))
          return true
      end
      return false
    end
    
    
    
    # Proporciona nuevos tesoros a un jugador cuando está en su primer turno o se ha 
    # quedado sin tesoros.
    # El número de tesoros que se les proporciona viene dado por el valor que saque al tirar
    # el dado.
    def initTreasures
      dealer = CardDealer.instance
      dice = Dice.instance
      bringToLife
      
      treasure = dealer.nextTreasure
      @hiddenTreasures << treasure
      number = dice.nextNumber
        
      if (number>1)
        treasure = dealer.nextTreasure
        @hiddenTreasures << treasure
      end
      
      if (number==6)
        treasure = dealer.nextTreasure
        @hiddenTreasures << treasure
      end
    end
    
    
    
    # Comprueba si un jugador puede robar un tesoro a su enemigo.
    # Si se puede, el tesoro se almacenaŕa en ocultos.
    # El jugador no puede volver a robar otro tesoro durante la partida.
    # En el caso que no se haya podido robar el tesoro por algún motivo devuelve null
    # @return Treasure tesoro robado   
    def stealTreasure
      canI = canISteal
      if(canI)
        canYou = @enemy.canYouGiveMeATreasure

        if (canYou)
          treasure = @enemy.giveMeATreasure
          @hiddenTreasures << treasure
          haveStolen
        end
      end
      return treasure
    end
    
    
    
    # Devuelve un tesoro elegido al azar de entre los tesoros ocultos del jugador
    def giveMeATreasure
      #Genero un número aletorio
      num = rand(0...@hiddenTreasures.length)
      # Elijo el tesoro a devolver
      tesoro = @hiddenTreasures.at(num);
      #Elimino el tesoro
      @hiddenTreasures.delete_at(num);
      return tesoro;
    end
    
    # Devuelve true si el jugador tiene tesoros para ser robados
    # por otro jugador y false en caso contrario.
    def canYouGiveMeATreasure
      return !(@hiddenTreasures.empty?)

    end
    
    
    # Cambia el atributo canISteal a false cuando el jugador roba un tesoro
    def haveStolen
      @canISteal=false
    end
    
    
    # Elimina todos los tesoros del jugador.
    def discardAllTreasures
      #listTreasure = Array.new
      listTreasurev = Array.new(@visibleTreasures)
      listTreasurev.each{ |treasure|  
        discardVisibleTreasure(treasure)
      }
        
      #listTreasure = Array.new
      listTreasureh = Array.new(@hiddenTreasures)
      listTreasureh.each{ |treasure|    
        discardHiddenTreasure(treasure);
      }
     
    end
    
    
    private :bringToLife, :incrementLevels, :decrementLevels
    private :setPendingBadConsequence, :applyPrize, :applyBadConsequence
    private :canMakeTreasureVisible, :howManyVisibleTreasures, :dieIfNoTreasures
    private :haveStolen
    
    protected :setEnemy, :getEnemy, :shouldConvert, :getOponentLevel, :getCombatLevel
    
    
    def to_s()
      " #{@name} \t level: #{@level} \t dead: #{@dead} \t enemy: #{@enemy.getName}\n"
    end
  end

  
end
