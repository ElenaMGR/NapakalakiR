# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class BadConsequence
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
  
  def BadConsequence.newLevelNumberOfTreasures (aText, someLevels, someVisibleTreasures, 
      someHiddenTreasures)
    @aText=aText
    @death=false
    @someLevels=someLevels
    @someVisibleTreasures=someVisibleTreasures
    @someHiddenTreasures=someHiddenTreasures
    @someSpecificVisibleTreasures=nil
    @someSpecificHiddenTreasures=nil
  end

  def BadConsequence.newLevelSpecificTreasures (aText, someLevels, 
      someSpecificVisibleTreasures, someSpecificHiddenTreasures)
    @aText=aText
    @death=false
    @someLevels=someLevels 
    @someSpecificVisibleTreasures=someSpecificVisibleTreasures
    @someSpecificHiddenTreasures=someSpecificHiddenTreasures
    if (someSpecificVisibleTreasures!=nil)
      @someVisibleTreasures=someSpecificVisibleTreasures.size
    else
      @someVisibleTreasures=0
    end
    if (someSpecificHiddenTreasures!=nil)
      @someHiddenTreasures=someSpecificHiddenTreasures.size
    else
      @someHiddenTreasures=0
    end
  end

  def BadConsequence.newDeath (aText)
    @aText=aText
    @death=true
    @someLevels=0
    @someVisibleTreasures=0
    @someHiddenTreasures=0
    @someSpecificVisibleTreasures=nil
    @someSpecificHiddenTreasures=nil
  end
end
