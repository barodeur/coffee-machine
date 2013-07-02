drinks = require './lib/drinks/all'
redis = require "redis"
client = redis.createClient()

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

coldDrinks = [
  'orange'
]

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
  drink = drinks[order.type]

  if order.type is 'orange'
    return 'O::'

  # Check money
  if order.money < drink.price
    return "M:#{messages.notEnoughMoney}"

  # Check sugar
  sugar = 2 if sugar > 2

  # Check stick
  stick = sugar > 0

  orderStr = drink.code
  hotStr = if order.extraHot and drink.canBeHot then "h" else ""
  sugarStr = if sugar > 0 then sugar else ""
  stickStr = if stick then 0 else ""

  client.hincrby "coffee", orderStr, 1
  return "#{orderStr}#{hotStr}:#{sugarStr}:#{stickStr}"

module.exports = make

client.hgetall "coffee", (err, obj) ->
  cprice = obj.C * drinks.coffee.price / 100 || 0
  tprice = obj.T * drinks.tea.price / 100 || 0
  hprice = obj.H * drinks.chocolate.price / 100 || 0
  oprice = obj.O * drinks.orange.price / 100 || 0

  console.log "Coffee : #{obj.C || 0} total : #{cprice}€"
  console.log "Tea : #{obj.T || 0} total : #{tprice}€"
  console.log "Chocolate : #{obj.H || 0} total : #{hprice}€"
  console.log "Orange : #{obj.O || 0} total : #{oprice}€"
  console.log "Total : #{cprice + tprice + hprice + oprice}€"

  process.exit 0
