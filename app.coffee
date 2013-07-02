orderSample =
 type: 'chocolate'
 sugar: 1
 money: 500 # $5

outputSample = "H:1:0"


drinkCodes =
  'chocolate': 'H'
  'tea': 'T'
  'coffee': 'C'

prices =
  chocolate: 50
  tea: 40
  coffee: 60

# MESSAGES
messages =
  notEnoughMoney: "NOT ENOUGH MONEY! F*CKING BASTARD!"

make = (order) ->
  sugar = order.sugar
  sugar = 2 if sugar > 2

  stick = sugar > 0

  # Check money
  if order.money < prices[order.type]
    return "M:#{messages.notEnoughMoney}"

  orderStr = drinkCodes[order.type]
  sugarStr = if sugar > 0 then sugar else ""
  stickStr = if stick then 0 else ""

  return "#{orderStr}:#{sugarStr}:#{stickStr}"

module.exports = make
