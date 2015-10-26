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
badConsequence = BadConsequence.newLevelSpecificTreasures('Pierdes tu armadura visible y otra oculta', 0,[TreasureKind::ARMOR],[TreasureKind::ARMOR])
monsters << Monster.new('3 Byakhees de bonanza', 8, prize, badConsequence)

prize = Prize.new(1,1)
badConsequence = BadConsequence.newLevelSpecificTreasures('Embobados con el lindo primigenio te descartas de tu casco visible', 0,[TreasureKind::HELMET],Array.new)
monsters << Monster.new('Chibithulhu', 2, prize, badConsequence)

prize = Prize.new(1,1)
badConsequence = BadConsequence.newLevelSpecificTreasures('El primordial bostezo contagioso. Pierdes el calzado visible', 0,[TreasureKind::SHOES],Array.new)
monsters << Monster.new('El sopor de Dunwich', 2, prize, badConsequence)


prize = Prize.new(4,1)
badConsequence = BadConsequence.newLevelSpecificTreasures('Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta', 0,[TreasureKind::ONEHAND],[TreasureKind::ONEHAND])
monsters << Monster.new('Angeles de la noche ibicenca', 14, prize, badConsequence)

price = Prize.new(3,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes todos tus tesoros visibles',0 , 6, 0)
monsters << Monster.new('El gorron en el umbral',10,price,badConsequence)

prize = Prize.new(2,1)
badConsequence = BadConsequence.newLevelSpecificTreasures('Pierdes la armadura visible', 0,[TreasureKind::ARMOR],Array.new)
monsters << Monster.new('H.P. Munchcraft', 6, prize, badConsequence)

prize = Prize.new(1,1)
badConsequence = BadConsequence.newLevelSpecificTreasures('Sientes bichos bajo la ropa. Descarta la armadura visible', 0,[TreasureKind::ARMOR],Array.new)
monsters << Monster.new('Bichgooth', 2, prize, badConsequence)

price = Prize.new(4,2)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 5 niveles y 3 tesoros visibles',5 , 3, 0)
monsters << Monster.new('El rey de rosa',13,price,badConsequence)

price = Prize.new(1,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Toses los pulmones y pierdes 2 niveles.',2 , 0, 0)
monsters << Monster.new('La que redacta en las tinieblas',2,price,badConsequence)

price = Prize.new(2,1)
badConsequence = BadConsequence.newDeath("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto")
monsters << Monster.new('Los hondos',8,price,badConsequence)

price = Prize.new(2,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 2 niveles y 2 tesoros ocultos.',2 , 0, 2)
monsters << Monster.new('Semillas Cthulhu',4,price,badConsequence)

prize = Prize.new(2,1)
badConsequence = BadConsequence.newLevelSpecificTreasures('Te intentas escaquear. Pierdes una mano visible.', 0,[TreasureKind::ONEHAND],Array.new)
monsters << Monster.new('Dameargo', 1, prize, badConsequence)

price = Prize.new(1,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Da mucho asquito. Pierdes 3 niveles.',3 , 0, 0)
monsters << Monster.new('Pollipolipo volante',3,price,badConsequence)

price = Prize.new(3,1)
badConsequence = BadConsequence.newDeath("No le hace gracia que pronuncien mal su nombre. Estas muerto")
monsters << Monster.new("Yskhtihyssg-Goth",12,price,badConsequence)

price = Prize.new(4,1)
badConsequence = BadConsequence.newDeath("La familia te atrapa. Estas muerto.")
monsters << Monster.new("Familia feliz",1,price,badConsequence)

price = Prize.new(2,1)
badConsequence = BadConsequence.newLevelSpecificTreasures("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible", 2, [TreasureKind::BOTHHANDS], Array.new)
monsters << Monster.new("Roboggoth",8,price,badConsequence)

price = Prize.new(1,1)
badConsequence = BadConsequence.newLevelSpecificTreasures("Te asusta en la noche. Pierdes un casco visible.", 0, [TreasureKind::HELMET], Array.new)
monsters << Monster.new("El espia",5,price,badConsequence)

price = Prize.new(1,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.", 2, 5, 0)
monsters << Monster.new("El lenguas",20,price,badConsequence)

price = Prize.new(1,1)
visible = Array.new
visible << TreasureKind::BOTHHANDS
visible << TreasureKind::ONEHAND
visible << TreasureKind::ONEHAND
badConsequence = BadConsequence.newLevelSpecificTreasures("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos", 3, visible, Array.new)
monsters << Monster.new("Bicefalo",20,price,badConsequence)



monsters.each { |m|puts m.to_s}

