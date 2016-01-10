#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame

  class SpecificBadConsequence < BadConsequence
    
    attr_reader :specificVisibleTreasures
    attr_reader :specificHiddenTreasures
    
    public_class_method :new
    
    def initialize (t,l,v,h)
      super(t,l)
      @specificVisibleTreasures = v
      @specificHiddenTreasures = h
    end
    
    def isEmpty
      vacio = false;
      if( @specificHiddenTreasures.empty? && @specificVisibleTreasures.empty?)
        vacio=true;
      end
      return vacio;
    end
    
    
    def substracVisibleTreasure (t)
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


    def substracHiddenTreasure (t)
      # Si es un tesoro especifico se elimina
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
    
    
    def adjustToFitTreasureList (v,h)
      hidden = Array.new
      visible = Array.new
      
      #Hacemos una copia en un auxiliar de los tipos de un jugador
      jugador = Array.new
      
      h.each { |treasure| 
        jugador << treasure.getType
        
      }
      
      # Si el jugador tiene objetos ocultos
      if(!h.empty? )
        #Si son objetos especificos los buscamos y eliminamos
        for i in 0...@specificHiddenTreasures.length
          encontrado = false
          for j in 0...jugador.size
            if encontrado
              break
            end
            
            if (@specificHiddenTreasures.at(i).eql?(jugador.at(j)))
              hidden << jugador.at(j)
              jugador.delete(j)
              encontrado = true
            end
            
          end
        end
              
      end
         
      #Hacemos una copia en un auxiliar de los tipos de un jugador
      jugador.clear
      
      v.each { |treasure| 
        jugador << treasure.getType
        
      }
      
      if(!v.empty? )
        #Si son objetos especificos los buscamos y eliminamos
        for i in 0...@specificVisibleTreasures.length
          encontrado = false
          for j in 0...jugador.size
            if encontrado
              break
            end
            
            if (@specificVisibleTreasures.at(i).eql?(jugador.at(j)))
              visible << jugador.at(j)
              jugador.delete(j)
              encontrado = true
            end
            
          end
        end
           
      end
      
      nuevo = SpecificBadConsequence.new(@text, @levels, visible, hidden)
      return nuevo
    end
    
    def to_s
      super
      "\t Tesoros específicos visibles: #{@specificVisibleTreasures} \t Tesoros específicos ocultos: #{@specificHiddenTreasures} \n"
    end
  
  end


end