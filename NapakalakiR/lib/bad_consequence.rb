#encoding:utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'treasure_kind'
require_relative 'treasure'
require_relative 'player'

module NapakalakiGame

  class BadConsequence
    #attr_accessor
    #attr_writter
    attr_reader :text
    attr_reader :levels
    
    private_class_method :new

    @@MAXTREASURES = 10

    def initialize(t, l)
      @text=t
      @levels=l  
    end

    # Metodo de clase que accede a la variabla MAXTREASURES
    def self.max_treasures
      @@MAXTREASURES
    end
    
    
    # Métodos Get
    def getText
        return @text;
    end

    def getLevels
        return @levels;
    end

    
    # Devuelve true cuando el mal rollo que tiene que cumplir el jugador está 
    # vacío, eso significa que el conjunto de atributos del mal rollo indica 
    # que no se pierden tesoros
    def isEmpty
      raise NotImplementedError.new
    end

    #
    # Actualiza el mal rollo para que el tesoro visible t no forme parte del mismo.
    # @param t Tesoro que se elimina.
    #
    def substracVisibleTreasure ()
      raise NotImplementedError.new
    end


    def substracHiddenTreasure ()
      raise NotImplementedError.new
    end


    # Ajusta el mal rollo de un monstruo a la posibilidad del jugador que tiene
    # que cumplirlo.
    # @param v lista de tesoros visibles del jugador
    # @param h lista de tesoros ocultos del jugador.
    # @return     
    def adjustToFitTreasureList ()
      raise NotImplementedError.new
    end


    def to_s
      "BadConsequence = #{@text} \n "+
        "\t Niveles: #{@levels} \n"
    end
  end

end
