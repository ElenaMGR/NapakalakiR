#encoding:utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'treasure_kind'

module NapakalakiGame

  class BadConsequence
    #attr_accessor
    #attr_writter
    attr_reader :text
    attr_reader :levels
    attr_reader :nVisibleTreasures
    attr_reader :nHiddenTreasures
    attr_reader :specificVisibleTreasures
    attr_reader :specificHiddenTreasures
    attr_reader :death
    private_class_method :new

    @@MAXTREASURES = 10

    def initialize(t, l, nVisible, nHidden, v, h, death)
      @text=t
      @levels=l
      @nVisibleTreasures=nVisible
      @nHiddenTreasures=nHidden
      @specificVisibleTreasures=v
      @specificHiddenTreasures=h
      @death=death    
    end

    def self.newLevelNumberOfTreasures (t, l, nVisible, nHidden)
      new(t, l, nVisible,nHidden,Array.new,Array.new,false)
    end

    def self.newLevelSpecificTreasures (t, l, v, h)

      new(t,l,0,0,v,h,false)

    end

    def self.newDeath (t)
       new(t,0,0,0,Array.new,Array.new,true)

    end


    def isEmpty ()

    end


    def substractVisibleTreasure (t)

    end


    def substractHiddenTreasure (t)

    end


    def adjustToFitTreasureLists (v,h)

    end


    def to_s
      "Mal rollo: #{@text} \n Niveles perdidos: #{@levels}, Tesoros visibles: #{@nVisibleTreasures}, Tesoros ocultos: #{@nHiddenTreasures},Tesoros específicos visibles: #{@specificVisibleTreasures}, Tesoros específicos ocultos: #{@specificHiddenTreasures}, Muerto: #{@death}."
    end
  end

end