# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'prize'
require 'bad_consequence'
require 'monster'

prize1 = Prize.new(2,1)
puts prize1.level
puts prize1.treasures

bc1 = BadConsequence.new('hola',1,0,1,0,0,0)
puts bc1
