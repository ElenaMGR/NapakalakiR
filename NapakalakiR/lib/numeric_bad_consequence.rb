#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame

  class NumericBadConsequence < BadConsequence
    
    attr_reader :nVisibleTreasures
    attr_reader :nHiddenTreasures
    
    public_class_method :new
   
    def initialize (t, l, nVisible, nHidden)
      super(t,l)
      @nVisibleTreasures = nVisible
      @nHiddenTreasures = nHidden
    end
    
    #Métodos Get y Set
    def getNVisibleTreasures
        return @nVisibleTreasures;
    end

    def getNHiddenTreasures
        return @nHiddenTreasures;
    end
    
    
    def isEmpty
      vacio = false;
      if( @nVisibleTreasures == 0 && @nHiddenTreasures == 0)
        vacio=true;
      end
      return vacio;
    end
    
    
    def substracVisibleTreasure (t)
      # Si es un numero se reduce en 1
      @nVisibleTreasures-=1;
    end


    def substracHiddenTreasure (t)
      # Si es un numero se reduce en 1
      @nHiddenTreasures-=1;
    end
    
    def adjustToFitTreasureList (v,h)
      nHidden = 0
      nVisible = 0
        
      # Si el jugador tiene objetos ocultos
      if(!h.empty? )
          # Si el jugador tiene objetos ocultos, quitamos los que no posea
            if(@nHiddenTreasures > 0) # Si es un numero lo ajustamos
                if(@nHiddenTreasures > h.length())
                    nHidden = h.length();
                else
                    nHidden = @nHiddenTreasures;
                end
                
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
                
            end
            
      end
      
      nuevo = self.new(getText, getLevels, nVisible, nHidden)
      return nuevo
    end
  
    def to_s
      super 
      "\t Tesoros visibles: #{@nVisibleTreasures} \t Tesoros ocultos: #{@nHiddenTreasures} \n"        
    end
  
  
  end


end