# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame

  class Prize
    # Consultores de acceso
    attr_reader :treasures
    attr_reader :levels


    # Constructor
    def initialize( t, l)
      @treasures = t
      @level = l
    end
    
    
    def to_s
      "Buen rollo: \n Tesoros ganados: #{@treasures}, Niveles ganados: #{@level}"
    end

  end


end