#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'monster'
require_relative 'treasure'
require_relative 'treasure_kind'
require 'singleton'

module NapakalakiGame

  class CardDealer
    
    include Singleton
    
    
    def initialize
      # Atributos
      @unusedMonsters = Array.new    
      @usedMonsters = Array.new
      @usedTreasures = Array.new
      @unusedTreasures = Array.new
    end
    
    # Inicializa el mazo de cartas de Tesoros.
    def initTreasureCardDeck
        @unusedTreasures << Treasure.new("¡Sí mi amo!",4,TreasureKind::HELMET)
        @unusedTreasures << Treasure.new("Botas de investigación",3,TreasureKind::SHOE)
        @unusedTreasures << Treasure.new("Capucha de Cthulhu",3,TreasureKind::HELMET)   
        @unusedTreasures << Treasure.new("A prueba de babas",2,TreasureKind::ARMOR)   
        @unusedTreasures << Treasure.new("Botas de lluvia ácida",1,TreasureKind::BOTHHANDS)
        @unusedTreasures << Treasure.new("Casco minero",2,TreasureKind::HELMET)
        @unusedTreasures << Treasure.new("Ametralladora Thompson",4,TreasureKind::BOTHHANDS)
        @unusedTreasures << Treasure.new("Camiseta de la UGR",1,TreasureKind::ARMOR)
        @unusedTreasures << Treasure.new("Clavo de rail ferroviario",3,TreasureKind::ONEHAND)
        @unusedTreasures << Treasure.new("Cuchillo de sushi arcano",2,TreasureKind::ONEHAND)
        @unusedTreasures << Treasure.new("Fez alópodo",3,TreasureKind::HELMET)
        @unusedTreasures << Treasure.new("Hacha prehistórica",2,TreasureKind::ONEHAND)
        @unusedTreasures << Treasure.new("El aparato del Pr. Tesla",4,TreasureKind::ARMOR)
        @unusedTreasures << Treasure.new("Gaita",4,TreasureKind::BOTHHANDS)
        @unusedTreasures << Treasure.new("Insecticida",2,TreasureKind::ONEHAND)
        @unusedTreasures << Treasure.new("Escopeta de 3 cañones",4,TreasureKind::BOTHHANDS)
        @unusedTreasures << Treasure.new("Garabato místico",2,TreasureKind::ONEHAND)
        @unusedTreasures << Treasure.new("La rebeca metálica",2,TreasureKind::ARMOR)
        @unusedTreasures << Treasure.new("Lanzallamas",4,TreasureKind::BOTHHANDS)
        @unusedTreasures << Treasure.new("Necro-comicón",1,TreasureKind::ONEHAND)
        @unusedTreasures << Treasure.new("Necronomicón",5,TreasureKind::BOTHHANDS)
        @unusedTreasures << Treasure.new("Linterna a 2 manos",3,TreasureKind::BOTHHANDS)
        @unusedTreasures << Treasure.new("Necro-gnomicón",2,TreasureKind::ONEHAND)
        @unusedTreasures << Treasure.new("Necrotelecom",2,TreasureKind::HELMET)
        @unusedTreasures << Treasure.new("Mazo de los antiguos",3,TreasureKind::ONEHAND)
        @unusedTreasures << Treasure.new("Necro-playboycón",3,TreasureKind::ONEHAND)
        @unusedTreasures << Treasure.new("Porra preternatural",2,TreasureKind::ONEHAND)
        @unusedTreasures << Treasure.new("Shogulador",1,TreasureKind::BOTHHANDS)
        @unusedTreasures << Treasure.new("Varita de atizamiento",3,TreasureKind::ONEHAND)
        @unusedTreasures << Treasure.new("Tentáculo de pega",2,TreasureKind::HELMET)
        @unusedTreasures << Treasure.new("Zapato deja-amigos",1,TreasureKind::SHOE)      
    end
    
    #Inicializa el mazo de cartas de monstruos.
    def initMonsterCardDeck
      prize = Prize.new(2,1)
      badConsequence = BadConsequence.newLevelSpecificTreasures('Pierdes tu armadura visible y otra oculta', 0,[TreasureKind::ARMOR],[TreasureKind::ARMOR])
      @unusedMonsters << Monster.new('3 Byakhees de bonanza', 8, badConsequence, prize)

      prize = Prize.new(1,1)
      badConsequence = BadConsequence.newLevelSpecificTreasures('Embobados con el lindo primigenio te descartas de tu casco visible', 0,[TreasureKind::HELMET],Array.new)
      @unusedMonsters << Monster.new('Chibithulhu', 2, badConsequence, prize)

      prize = Prize.new(1,1)
      badConsequence = BadConsequence.newLevelSpecificTreasures('El primordial bostezo contagioso. Pierdes el calzado visible', 0,[TreasureKind::SHOE],Array.new)
      @unusedMonsters << Monster.new('El sopor de Dunwich', 2, badConsequence, prize)


      prize = Prize.new(4,1)
      badConsequence = BadConsequence.newLevelSpecificTreasures('Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta', 0,[TreasureKind::ONEHAND],[TreasureKind::ONEHAND])
      @unusedMonsters << Monster.new('Ángeles de la noche ibicenca', 14, badConsequence, prize)

      prize = Prize.new(3,1)
      badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes todos tus tesoros visibles',0 , BadConsequence.max_treasures, 0)
      @unusedMonsters << Monster.new('El gorrón en el umbral',10,badConsequence, prize)

      prize = Prize.new(2,1)
      badConsequence = BadConsequence.newLevelSpecificTreasures('Pierdes la armadura visible', 0,[TreasureKind::ARMOR],Array.new)
      @unusedMonsters << Monster.new('H.P. Munchcraft', 6, badConsequence, prize)

      prize = Prize.new(1,1)
      badConsequence = BadConsequence.newLevelSpecificTreasures('Sientes bichos bajo la ropa. Descarta la armadura visible', 0,[TreasureKind::ARMOR],Array.new)
      @unusedMonsters << Monster.new('Bichgooth', 2, badConsequence, prize)

      prize = Prize.new(4,2)
      badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 5 niveles y 3 tesoros visibles',5 , 3, 0)
      @unusedMonsters << Monster.new('El rey de rosa',13,badConsequence, prize)

      prize = Prize.new(1,1)
      badConsequence = BadConsequence.newLevelNumberOfTreasures('Toses los pulmones y pierdes 2 niveles.',2 , 0, 0)
      @unusedMonsters << Monster.new('La que redacta en las tinieblas',2,badConsequence, prize)

      prize = Prize.new(2,1)
      badConsequence = BadConsequence.newDeath("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto")
      @unusedMonsters << Monster.new('Los hondos',8,badConsequence, prize)

      prize = Prize.new(2,1)
      badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 2 niveles y 2 tesoros ocultos.',2 , 0, 2)
      @unusedMonsters << Monster.new('Semillas Cthulhu',4,badConsequence, prize)

      prize = Prize.new(2,1)
      badConsequence = BadConsequence.newLevelSpecificTreasures('Te intentas escaquear. Pierdes una mano visible.', 0,[TreasureKind::ONEHAND],Array.new)
      @unusedMonsters << Monster.new('Dameargo', 1, badConsequence, prize)

      prize = Prize.new(1,1)
      badConsequence = BadConsequence.newLevelNumberOfTreasures('Da mucho asquito. Pierdes 3 niveles.',3 , 0, 0)
      @unusedMonsters << Monster.new('Pollipólipo volante',3,badConsequence, prize)

      prize = Prize.new(3,1)
      badConsequence = BadConsequence.newDeath("No le hace gracia que pronuncien mal su nombre. Estas muerto")
      @unusedMonsters << Monster.new("Yskhtihyssg-Goth",12,badConsequence, prize)

      prize = Prize.new(4,1)
      badConsequence = BadConsequence.newDeath("La familia te atrapa. Estas muerto.")
      @unusedMonsters << Monster.new("Familia feliz",1,badConsequence, prize)

      prize = Prize.new(2,1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible", 2, [TreasureKind::BOTHHANDS], Array.new)
      @unusedMonsters << Monster.new("Roboggoth",8,badConsequence, prize)

      prize = Prize.new(1,1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("Te asusta en la noche. Pierdes un casco visible.", 0, [TreasureKind::HELMET], Array.new)
      @unusedMonsters << Monster.new("El espia",5,badConsequence, prize)

      prize = Prize.new(1,1)
      badConsequence = BadConsequence.newLevelNumberOfTreasures("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.", 2, 5, 0)
      @unusedMonsters << Monster.new("El lenguas",20,badConsequence, prize)

      prize = Prize.new(1,1)
      visible = Array.new
      visible << TreasureKind::BOTHHANDS
      visible << TreasureKind::ONEHAND
      visible << TreasureKind::ONEHAND
      badConsequence = BadConsequence.newLevelSpecificTreasures("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos", 3, visible, Array.new)
      @unusedMonsters << Monster.new("Bicéfalo",20,badConsequence, prize)

      
    end
    
    # Baraja el mazo de cartas de tesoros
    def shuffleTreasures
      @unusedTreasures.shuffle!
    end

    # Baraja el mazo de cartas de monstruos
    def shuffleMonster
      @unusedMonsters.shuffle!
    end
    ##
     # Devuelve el siguiente tesoro que hay en el mazo de tesoros y lo elimina
     # de él. 
     # Si al iniciar el método el mazo estuviese vacío, pasa el mazo de decartes
     # al mazo de tesoros y lo baraja.
     #
    def nextTreasure
      # Si esta vacio el mazo de tesoros.
      if(@unusedTreasures.empty?)
        @unusedTreasures = @usedTreasures
        @usedTreasures.clear
        shuffleTreasures
      end
     # nuevo_tesoro = @unusedTreasures.at(@unusedTreasures.length-1);
      nuevo_tesoro = @unusedTreasures.pop
      return nuevo_tesoro
    end
    
    #
     # Devuelve el siguiente monstruo que hay en el mazo de monstruos y lo elimina
     # de él. 
     # Si al iniciar el método el mazo estuviese vacío, pasa el mazo de decartes
     # al mazo de monstruos y lo baraja.
     #
    def nextMonster
        # Si esta vacio el mazo de monstruos.
        if(@unusedMonsters.empty?)
            @unusedMonsters = @usedMonsters
            @usedMonster.clear
            shuffleMonster
        end
        #nuevo_monstruo = @unusedMonsters.at(@unusedMonsters.length-1);
        nuevo_monstruo = @unusedMonsters.pop
        return nuevo_monstruo;
    end
    
    # Introduce en el mazo de descartes de tesoros el tesoro t
    def giveTreasureBack(t)
      @usedTreasures << t
    end
    
    # Introduce en el mazo de descartes de monstruos el tesoro m
    def giveMonsterBack(m)
      @usedMonsters << m
    end
    
    
    # Inicializa los mazos
    def initCards
      initTreasureCardDeck
      initMonsterCardDeck
      # Barajamos los mazos de cartas
      shuffleMonster
      shuffleTreasures
    end  
    
  private :initTreasureCardDeck, :initMonsterCardDeck, :shuffleTreasures, :shuffleMonster
    
  end

end