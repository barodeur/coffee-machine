make = require "../app"
assert = require "assert"

describe 'CoffeeMachine', () ->
  describe 'Simple tests', () ->
    it 'should return "T:1:0"', () ->
      assert.equal "T:1:0", make
        type: "tea"
        sugar: 1
        
    it 'should return "H::"', () ->
      assert.equal "H::", make
        type: "chocolate"
        sugar: 0
        
    it 'should return "C:2:0"', () ->
      assert.equal "C:2:0", make
        type: "coffee"
        sugar: 2

  describe 'Money tests', () ->
    it 'should return "M:Not enough money', () ->
      assert.equal "M:Not enough money", make
        type: "tea"
        sugar: 0
        money: 39

      assert.equal "H:1:0", make
        type: "chocolate"
        sugar: 1
        money: 50

      assert.notEqual "M:Not enough money", make
        type: "coffee"
        sugar: 2
        money: 60
