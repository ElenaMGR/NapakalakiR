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
  
  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures, someSpecificVisibleTreasures, someSpecificHiddenTreasures, death)
    @aText=aText
    @someLevels=someLevels
    @someVisibleTreasures=someVisibleTreasures
    @someHiddenTreasures=someHiddenTreasures
    @someSpecificVisibleTreasures=someSpecificVisibleTreasures
    @someSpecificHiddenTreasures=someSpecificHiddenTreasures
    @death=death
  end
end
