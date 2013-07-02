orderSample =
 type: 'chocolate'
 sugar: 1

outputSample = "H:1:0"


drinkCodes =
  'chocolate': 'H'
  'tea': 'T'
  'coffee': 'C'

make = (order) ->
  sugar = order.sugar
  sugar = 2 if sugar > 2

  stick = sugar > 0

  orderStr = drinkCodes[order.type]
  sugarStr = if sugar > 0 then sugar else ""
  stickStr = if stick then 0 else ""

  return "#{orderStr}:#{sugarStr}:#{stickStr}"

module.exports = make
