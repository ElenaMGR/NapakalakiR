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
      @levels = l
    end
    
    # Métodos get
    def getTreasures
        return @treasures;
    end
    
    def getLevels
        return @levels;
    end
    
    
    def to_s
      "Prize: Tesoros ganados = #{@treasures} \t Niveles ganados: #{@levels} \n"
    end

  end


end