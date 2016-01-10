#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'numeric_bad_consequence'

module NapakalakiGame

  class DeathBadConsequence < NumericBadConsequence  
    
    def initialize (t)
      super(t,Player.maxLevel,BadConsequence.max_treasures,BadConsequence.max_treasures)
    end

  end


end