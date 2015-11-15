# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'singleton'

module NapakalakiGame
  
  class Dice
    
    include Singleton
    
    # Genera un número aleatorio entre 1 y 6 
    def next_number
      return 1 + rand(6)
    end
    
    
  end

end