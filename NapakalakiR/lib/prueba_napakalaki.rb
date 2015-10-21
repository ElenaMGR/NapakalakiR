# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'prize'
require_relative 'bad_consequence'
#require 'monster'

prize1 = Prize.new(2,1)
puts prize1.to_s

#bc1 = BadConsequence.newLevelNumberOfTreasures('hola',1,0,1)
#puts bc1.aText

bad = BadConsequence.newDeath("texto muerte")
puts bad.to_s

bad = BadConsequence.newLevelNumberOfTreasures("texto niveles", 1, 2, 3)
puts bad.to_s

visible = Array.new
visible= TreasureKind::ARMOR


oculto = Array.new
bad = BadConsequence.newLevelSpecificTreasures("texto array", 3, visible, oculto)
puts bad
