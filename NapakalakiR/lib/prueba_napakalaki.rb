#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'prize'
require_relative 'bad_consequence'
require_relative 'monster'

module NapakalakiGame
  
  class PruebaNapakalaki

    #Creacion de los monstruos
    def createMonster
      monsters = Array.new

      prize = Prize.new(2,1)
      badConsequence = BadConsequence.new_level_specific_treasures('Pierdes tu armadura visible y otra oculta', 0,[TreasureKind::ARMOR],[TreasureKind::ARMOR])
      monsters << Monster.new('3 Byakhees de bonanza', 8, badConsequence, prize)

      prize = Prize.new(1,1)
      badConsequence = BadConsequence.new_level_specific_treasures('Embobados con el lindo primigenio te descartas de tu casco visible', 0,[TreasureKind::HELMET],Array.new)
      monsters << Monster.new('Chibithulhu', 2, badConsequence, prize)

      prize = Prize.new(1,1)
      badConsequence = BadConsequence.new_level_specific_treasures('El primordial bostezo contagioso. Pierdes el calzado visible', 0,[TreasureKind::SHOE],Array.new)
      monsters << Monster.new('El sopor de Dunwich', 2, badConsequence, prize)


      prize = Prize.new(4,1)
      badConsequence = BadConsequence.new_level_specific_treasures('Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta', 0,[TreasureKind::ONEHAND],[TreasureKind::ONEHAND])
      monsters << Monster.new('Angeles de la noche ibicenca', 14, badConsequence, prize)

      price = Prize.new(3,1)
      badConsequence = BadConsequence.new_level_number_of_treasures('Pierdes todos tus tesoros visibles',0 , BadConsequence.max_treasures, 0)
      monsters << Monster.new('El gorron en el umbral',10,badConsequence, prize)

      prize = Prize.new(2,1)
      badConsequence = BadConsequence.new_level_specific_treasures('Pierdes la armadura visible', 0,[TreasureKind::ARMOR],Array.new)
      monsters << Monster.new('H.P. Munchcraft', 6, badConsequence, prize)

      prize = Prize.new(1,1)
      badConsequence = BadConsequence.new_level_specific_treasures('Sientes bichos bajo la ropa. Descarta la armadura visible', 0,[TreasureKind::ARMOR],Array.new)
      monsters << Monster.new('Bichgooth', 2, badConsequence, prize)

      price = Prize.new(4,2)
      badConsequence = BadConsequence.new_level_number_of_treasures('Pierdes 5 niveles y 3 tesoros visibles',5 , 3, 0)
      monsters << Monster.new('El rey de rosa',13,badConsequence, prize)

      price = Prize.new(1,1)
      badConsequence = BadConsequence.new_level_number_of_treasures('Toses los pulmones y pierdes 2 niveles.',2 , 0, 0)
      monsters << Monster.new('La que redacta en las tinieblas',2,badConsequence, prize)

      price = Prize.new(2,1)
      badConsequence = BadConsequence.new_death("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto")
      monsters << Monster.new('Los hondos',8,badConsequence, prize)

      price = Prize.new(2,1)
      badConsequence = BadConsequence.new_level_number_of_treasures('Pierdes 2 niveles y 2 tesoros ocultos.',2 , 0, 2)
      monsters << Monster.new('Semillas Cthulhu',4,badConsequence, prize)

      prize = Prize.new(2,1)
      badConsequence = BadConsequence.new_level_specific_treasures('Te intentas escaquear. Pierdes una mano visible.', 0,[TreasureKind::ONEHAND],Array.new)
      monsters << Monster.new('Dameargo', 1, badConsequence, prize)

      price = Prize.new(1,1)
      badConsequence = BadConsequence.new_level_number_of_treasures('Da mucho asquito. Pierdes 3 niveles.',3 , 0, 0)
      monsters << Monster.new('Pollipolipo volante',3,badConsequence, prize)

      price = Prize.new(3,1)
      badConsequence = BadConsequence.new_death("No le hace gracia que pronuncien mal su nombre. Estas muerto")
      monsters << Monster.new("Yskhtihyssg-Goth",12,badConsequence, prize)

      price = Prize.new(4,1)
      badConsequence = BadConsequence.new_death("La familia te atrapa. Estas muerto.")
      monsters << Monster.new("Familia feliz",1,badConsequence, prize)

      price = Prize.new(2,1)
      badConsequence = BadConsequence.new_level_specific_treasures("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible", 2, [TreasureKind::BOTHHANDS], Array.new)
      monsters << Monster.new("Roboggoth",8,badConsequence, prize)

      price = Prize.new(1,1)
      badConsequence = BadConsequence.new_level_specific_treasures("Te asusta en la noche. Pierdes un casco visible.", 0, [TreasureKind::HELMET], Array.new)
      monsters << Monster.new("El espia",5,badConsequence, prize)

      price = Prize.new(1,1)
      badConsequence = BadConsequence.new_level_number_of_treasures("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.", 2, 5, 0)
      monsters << Monster.new("El lenguas",20,badConsequence, prize)

      price = Prize.new(1,1)
      visible = Array.new
      visible << TreasureKind::BOTHHANDS
      visible << TreasureKind::ONEHAND
      visible << TreasureKind::ONEHAND
      badConsequence = BadConsequence.new_level_specific_treasures("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos", 3, visible, Array.new)
      monsters << Monster.new("Bicefalo",20,badConsequence, prize)

      return monsters
    end

    #Monstuos con un nivel de combate superior a 10
    def combateSuperior10(m)
      resultado = Array.new
      m.each { |mo| 
        if(mo.combatLevel>10)
          resultado<<mo
        end
        }
      return resultado
    end
  
    #Monstuos que tienen un mal rollo que solo implica pérdida de niveles
    def malRolloSoloPerdidaNiveles(m)
      resultado = Array.new
      m.each { |mo| 
        if( mo.badConsequence.levels > 0 && mo.badConsequence.nVisibleTreasures==0 && mo.badConsequence.nHiddenTreasures==0 && mo.badConsequence.specificHiddenTreasures.empty? && mo.badConsequence.specificVisibleTreasures.empty?)
          resultado<<mo
        end
      }
      return resultado
    end
  
    #Monstuos que tienen un buen rollo que implica una ganancia de niveles superior a 1
    def priceWinLvlG1(m)
      resultado = Array.new
      m.each { |mo| 
        if(mo.get_levels_gained>1)
          resultado<<mo
        end
        }
      return resultado
    end
  
    #Monstuos que tienen un mal rollo que implica perdida de un objeto específico
    def bcLostSpecificTreasure(m)
      resultado = Array.new
      m.each { |mo| 
        if(!mo.badConsequence.specificHiddenTreasures.empty? || !mo.badConsequence.specificVisibleTreasures.empty? )
          resultado<<mo
        end
        }
      return resultado
    end
  
  

    def prueba
      #Creamos las cartas de los monstruos
      monsters = Array.new
      monsters = createMonster


      #monsters.each { |m|puts m.to_s}

      res = Array.new
      res = combateSuperior10(monsters)

      puts "Monstuos con un nivel de combate superior a 10"
      res.each { |m|puts m.to_s}


      res = malRolloSoloPerdidaNiveles(monsters)

      puts "\n\nMonstuos que tienen un mal rollo que solo implica pérdida de niveles"
      res.each { |m|puts m.to_s}


      res = priceWinLvlG1(monsters)

      puts "\n\nMonstuos que tienen un buen rollo que implica una ganancia de niveles superior a 1"
      res.each { |m|puts m.to_s}


      res = bcLostSpecificTreasure(monsters)

      puts "\n\nMonstuos que tienen un mal rollo que implica perdida de un objeto específico"
      res.each { |m|puts m.to_s}
    end
  
  end

  e = PruebaNapakalaki.new
  e.prueba

end