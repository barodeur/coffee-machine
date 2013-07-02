make = require "../app"
assert = require "assert"

describe 'CoffeeMachine', () ->
  describe 'Tea with on sugar', () ->
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
