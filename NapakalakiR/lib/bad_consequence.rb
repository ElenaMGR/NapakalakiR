#encoding:utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'treasure_kind'

class BadConsequence
  #attr_accessor
  #attr_writter
  attr_reader :aText
  attr_reader :someLevels
  attr_reader :someVisibleTreasures
  attr_reader :someHiddenTreasures
  attr_reader :someSpecificVisibleTreasures
  attr_reader :someSpecificHiddenTreasures
  attr_reader :death
  private_class_method :new
  
  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures, someSpecificVisibleTreasures, someSpecificHiddenTreasures, death)
    @aText=aText
    @someLevels=someLevels
    @someVisibleTreasures=someVisibleTreasures
    @someHiddenTreasures=someHiddenTreasures
    @someSpecificVisibleTreasures=someSpecificVisibleTreasures
    @someSpecificHiddenTreasures=someSpecificHiddenTreasures
    @death=death    
  end
  
  def self.newLevelNumberOfTreasures (aText, someLevels, someVisibleTreasures, 
      someHiddenTreasures)
    new(aText, someLevels, someVisibleTreasures,someHiddenTreasures,Array.new,Array.new,false)
  end

  def self.newLevelSpecificTreasures (aText, someLevels, 
      someSpecificVisibleTreasures, someSpecificHiddenTreasures)
    
    new(aText,someLevels,0,0,someSpecificVisibleTreasures,someSpecificHiddenTreasures,false)
   
  end
  
  def self.newDeath (aText)
     new(aText,0,0,0,Array.new,Array.new,true)

  end
  
  def to_s
    "Mal rollo: #{@aText} \n Niveles perdidos: #{@someLevels}, Tesoros visibles: 
    #{@someVisibleTreasures}, Tesoros ocultos: #{@someHiddenTreasures},
    Tesoros específicos visibles: #{@someSpecificVisibleTreasures},
    Tesoros específicos ocultos: #{@someSpecificHiddenTreasures},
    Muerto: #{@death}."
  end
end
