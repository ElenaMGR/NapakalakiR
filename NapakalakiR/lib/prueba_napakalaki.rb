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
monsters[0]= Monster.new('3 Byakhees de bonanza', 8, prize, badConsequence)

prize = Prize.new(1,1)
badConsequence = BadConsequence.newLevelSpecificTreasures('Embobados con el lindo
  primigenio te descartas de tu casco visible', 0,[TreasureKind::HELMET],Array.new)
monsters[1]= Monster.new('Chibithulhu', 2, prize, badConsequence)

prize = Prize.new(1,1)
badConsequence = BadConsequence.newLevelSpecificTreasures('El primordial bostezo
  contagioso. Pierdes el calzado visible', 0,[TreasureKind::SHOES],Array.new)
monsters[2]= Monster.new('El sopor de Dunwich', 2, prize, badConsequence)


prize = Prize.new(4,1)
badConsequence = BadConsequence.newLevelSpecificTreasures('Te atrapan para llevarte 
  de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible 
  y 1 mano oculta', 0,[TreasureKind::ONEHAND],[TreasureKind::ONEHAND])
monsters[3]= Monster.new('Angeles de la noche ibicenca', 14, prize, badConsequence)

price = Prize.new(3,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes todos tus tesoros
  visibles',0 , 6, 0)
monsters[4] = Monster.new('El gorron en el umbral',10,price,badConsequence)

prize = Prize.new(2,1)
badConsequence = BadConsequence.newLevelSpecificTreasures('Pierdes la armadura 
  visible', 0,[TreasureKind::ARMOR],Array.new)
monsters[5]= Monster.new('H.P. Munchcraft', 6, prize, badConsequence)

prize = Prize.new(1,1)
badConsequence = BadConsequence.newLevelSpecificTreasures('Sientes bichos bajo la
  ropa. Descarta la armadura visible', 0,[TreasureKind::ARMOR],Array.new)
monsters[6]= Monster.new('Bichgooth', 2, prize, badConsequence)

price = Prize.new(4,2)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 5 niveles y 3 tesoros visibles',5 , 3, 0)
monsters[7] = Monster.new('El rey de rosa',13,price,badConsequence)

price = Prize.new(1,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Toses los pulmones y
  pierdes 2 niveles.',2 , 0, 0)
monsters[8] = Monster.new('La que redacta en las tinieblas',2,price,badConsequence)

price = Prize.new(2,1)
badConsequence = BadConsequence.newDeath("Estos monstruos resultan bastante 
  superficiales y te aburren mortalmente. Estas muerto")
monsters[9] = Monster.new('Los hondos',8,price,badConsequence)

price = Prize.new(2,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 2 niveles y 2
  tesoros ocultos.',2 , 0, 2)
monsters[8] = Monster.new('Semillas Cthulhu',4,price,badConsequence)

prize = Prize.new(2,1)
badConsequence = BadConsequence.newLevelSpecificTreasures('Te intentas escaquear.
  Pierdes una mano visible.', 0,[TreasureKind::ONEHAND],Array.new)
monsters[9]= Monster.new('Dameargo', 1, prize, badConsequence)

price = Prize.new(1,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 2 niveles y 2
  tesoros ocultos.',3 , 0, 0)
monsters[10] = Monster.new('Pollipolipo volante',3,price,badConsequence)


puts monsters.to_s
