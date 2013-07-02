orderSample =
 type: 'chocolate'
 sugar: 1
 money: 500 # $5
 extraHot: true

outputSample = "H:1:0"


drinkCodes =
  'chocolate': 'H'
  'tea': 'T'
  'coffee': 'C'
  'orange': 'O'

prices =
  chocolate: 50
  tea: 40
  coffee: 60
  orange: 60

# MESSAGES
messages =
  notEnoughMoney: "Not enough money"

make = (order) ->
  sugar = order.sugar

  # Check money
  if order.money < prices[order.type]
    return "M:#{messages.notEnoughMoney}"

  # Check sugar
  sugar = 2 if sugar > 2

  # Check stick
  stick = sugar > 0

  orderStr = drinkCodes[order.type]
  sugarStr = if sugar > 0 then sugar else ""
  stickStr = if stick then 0 else ""

  return "#{orderStr}:#{sugarStr}:#{stickStr}"

module.exports = make
