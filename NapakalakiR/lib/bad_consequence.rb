#encoding:utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'treasure_kind'
require_relative 'treasure'
require_relative 'player'

module NapakalakiGame

  class BadConsequence
    #attr_accessor
    #attr_writter
    attr_reader :text
    attr_reader :levels
    attr_reader :nVisibleTreasures
    attr_reader :nHiddenTreasures
    attr_reader :specificVisibleTreasures
    attr_reader :specificHiddenTreasures
    attr_reader :death
    private_class_method :new

    @@MAXTREASURES = 10

    def initialize(t, l, nVisible, nHidden, v, h, death)
      @text=t
      @levels=l
      @nVisibleTreasures=nVisible
      @nHiddenTreasures=nHidden
      @specificVisibleTreasures=v
      @specificHiddenTreasures=h
      @death=death    
    end

    # Metodo de clase que accede a la variabla MAXTREASURES
    def self.max_treasures
      @@MAXTREASURES
    end
    
    def self.newLevelNumberOfTreasures(t, l, nVisible, nHidden)
      new(t, l, nVisible,nHidden,Array.new,Array.new,false)
    end

    def self.newLevelSpecificTreasures(t, l, v, h)

      new(t,l,0,0,v,h,false)

    end

    def self.newDeath (t)
       new(t,Player.maxLevel,@@MAXTREASURES,@@MAXTREASURES,Array.new,Array.new,true)

    end
    
    # Métodos Get
    def getText
        return @text;
    end

    def getLevels
        return @levels;
    end

    def getNVisibleTreasures
        return @nVisibleTreasures;
    end

    def getNHiddenTreasures
        return @nHiddenTreasures;
    end

    def isDeath
        return @death;
    end
    
    
    # Devuelve true cuando el mal rollo que tiene que cumplir el jugador está 
    # vacío, eso significa que el conjunto de atributos del mal rollo indica 
    # que no se pierden tesoros
    def isEmpty
      vacio = false;
      if( !@death && @levels == 0 && @nVisibleTreasures == 0 && @nHiddenTreasures == 0 && @specificHiddenTreasures.empty? && @specificVisibleTreasures.empty?)
        vacio=true;
      end
      return vacio;
    end

    #
    # Actualiza el mal rollo para que el tesoro visible t no forme parte del mismo.
    # @param t Tesoro que se elimina.
    #
    def substracVisibleTreasure (t)
      if( @nVisibleTreasures != 0 ) # Si es un numero se reduce en 1
            @nVisibleTreasures-=1;
      else  # Si es un tesoro especifico se elimina
          i = 0
          no_encontrado = true
          while(i < @specificVisibleTreasures.length && no_encontrado)
            if(@specificVisibleTreasures.at(i) == t.getType)
              @specificVisibleTreasures.delete_at(i)
              no_encontrado = false
            end
            i+=1
          end  
            
      end
    end


    def substracHiddenTreasure (t)
      if( @nHiddenTreasures != 0 ) # Si es un numero se reduce en 1
            @nHiddenTreasures-=1;
      else  # Si es un tesoro especifico se elimina
          i = 0
          no_encontrado = true
          while(i < @specificHiddenTreasures.length && no_encontrado)
            if(@specificHiddenTreasures.at(i) == t.getType)
              @specificHiddenTreasures.delete_at(i)
              no_encontrado = false
            end
            i+=1
          end  
            
      end
    end


    # Ajusta el mal rollo de un monstruo a la posibilidad del jugador que tiene
    # que cumplirlo.
    # @param v lista de tesoros visibles del jugador
    # @param h lista de tesoros ocultos del jugador.
    # @return     
    def adjustToFitTreasureList (v,h)
      nHidden = 0
      nVisible = 0
      hidden = Array.new
      visible = Array.new
        
      # Si el jugador tiene objetos ocultos
      if(!h.empty? )
          # Si el jugador tiene objetos ocultos, quitamos los que no posea
            if(@nHiddenTreasures > 0) # Si es un numero lo ajustamos
                if(@nHiddenTreasures > h.length())
                    nHidden = h.length();
                else
                    nHidden = @nHiddenTreasures;
                end
                
            else #Si son objetos especificos los buscamos y eliminamos
              h.each { |treasure| 
                if(@specificHiddenTreasures.include?(treasure.getType) )
                  hidden << treasure.getType
                end  
              }
              
            end
            
      end
      
      
      if(!v.empty? )
          # Si el jugador tiene objetos ocultos, quitamos los que no posea
            if(@nVisibleTreasures > 0) # Si es un numero lo ajustamos
                if(@nVisibleTreasures > v.length)
                    nVisible = v.length
                else
                    nVisible = @nVisibleTreasures;
                end
                
            else #Si son objetos especificos los buscamos y eliminamos
              v.each { |treasure| 
                if(@specificVisibleTreasures.include?(treasure.getType) )
                  visible << treasure.getType
                end    
              }  
              
            end
            
      end
      
      nuevo = BadConsequence.newLevelSpecificTreasures(@text, @levels, visible, hidden);
      nuevo.nHiddenTreasures = nHidden;
      nuevo.nVisibleTreasures = nVisible;
      return nuevo;
    end


    def to_s
      "Mal rollo: #{@text} \n Niveles perdidos: #{@levels}, Tesoros visibles: #{@nVisibleTreasures}, Tesoros ocultos: #{@nHiddenTreasures},Tesoros específicos visibles: #{@specificVisibleTreasures}, Tesoros específicos ocultos: #{@specificHiddenTreasures}, Muerto: #{@death}."
    end
  end

end
