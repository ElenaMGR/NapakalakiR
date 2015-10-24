# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'prize'
require_relative 'bad_consequence'
require_relative 'monster'

#prize1 = Prize.new(2,1)
#puts prize1.to_s
#
##bc1 = BadConsequence.newLevelNumberOfTreasures('hola',1,0,1)
##puts bc1.aText
#
#bad = BadConsequence.newDeath("texto muerte")
#puts bad.to_s
#
#bad = BadConsequence.newLevelNumberOfTreasures("texto niveles", 1, 2, 3)
#puts bad.to_s
#
#visible = Array.new
#visible= TreasureKind::ARMOR
#
#
#oculto = Array.new
#bad = BadConsequence.newLevelSpecificTreasures("texto array", 3, visible, oculto)
#puts bad


monsters = Array.new

prize = Prize.new(2,1)
badConsequence = BadConsequence.newLevelSpecificTreasures('Pierdes tu armadura visible y otra 
  oculta', 0,[TreasureKind::ARMOR],[TreasureKind::ARMOR])
monsters[1]= Monster.new('3 Byakhees de bonanza', 8, prize, badConsequence)



price = Prize.new(4,2)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 5 niveles y 3 tesoros visibles',5 , 3, 0)
monsters[0] = Monster.new('El rey de rosa',13,price,badConsequence)

prize = Prize.new(4,1)
badConsequence = BadConsequence.newLevelSpecificTreasures('Te atrapan para llevarte 
 de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta', 0,[TreasureKind::ONEHAND],[TreasureKind::ONEHAND])
monsters[1]= Monster.new('Angeles de la noche ibicenca', 14, prize, badConsequence)



puts monsters.to_s
