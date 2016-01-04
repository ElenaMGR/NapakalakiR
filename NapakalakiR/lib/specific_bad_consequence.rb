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
      
      # Si el jugador tiene objetos ocultos
      if(!h.empty? )
        ntesoros = @specificHiddenTreasures.length
        #Si son objetos especificos los buscamos y eliminamos
        h.each { |treasure| 
          if (ntesoros > 0)
            if(@specificHiddenTreasures.include?(treasure.getType) )
              hidden << treasure.getType
              ntesoros-=1
            end  
          end
        }
              
      end
            
      if(!v.empty? )
        ntesoros = @specificVisibleTreasures.length
        #Si son objetos especificos los buscamos y eliminamos
        v.each { |treasure| 
          if (ntesoros > 0)
            if(@specificVisibleTreasures.include?(treasure.getType) )
              visible << treasure.getType
              ntesoros-=1
            end
          end
        }  
           
      end
      
      nuevo = SpecificBadConquecence.new(@text, @levels, visible, hidden)
      return nuevo
    end
    
    def to_s
      super
      "\t Tesoros específicos visibles: #{@specificVisibleTreasures} \t Tesoros específicos ocultos: #{@specificHiddenTreasures} \n"
    end
  
  end


end