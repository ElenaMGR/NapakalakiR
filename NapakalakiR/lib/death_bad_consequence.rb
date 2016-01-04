# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame

  class DeathBadConsequence < NumericBadConsequence
    
    attr_reader :death
    
    def initialize (t, death)
      super(t,Player.maxLevel,max_treasures,max_treasures)
      @death = death
    end
    
    def isDeath
        return @death
    end
    
    def setDeath(d)
      @death = d
    end
    
    
    def to_s
      super 
      "death: #{@death} \n"
    end
  end


end