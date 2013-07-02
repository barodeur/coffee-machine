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

  describe 'Ogrange tests', () ->
    it 'sould not give sugar with orange juice', ->
      assert.equal "O::", make
        type: 'orange'
        sugar: 1
        money: 100
  describe 'keep it hot pleaze', () ->
    it 'should keep my chocolate extra hot !', ->
      assert.equal "Hh:1:0", make
        type: 'chocolate'
        sugar: 1
        money: 100
        extraHot: true
    it 'my orange should not be warmed', ->
      assert.equal "O::", make
        type: 'orange'
        sugar: 1
        money: 100
        extraHot: true
