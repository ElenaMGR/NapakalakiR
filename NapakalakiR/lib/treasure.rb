# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


module NapakalakiGame
  
  class Treasure

    # Consultores de acceso
    attr_reader :name, :bonus, :type

    # Constructor
    def initialize (n, bonus, t)
      @name = n
      @bonus = bonus
      @type = t
    end

  end

end