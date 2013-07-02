module.exports = ['chocolate', 'orange', 'tea', 'coffee'].reduce(
  (memo, type) ->
    klass = require("./#{type}")
    memo[type] = new klass()
    memo
  {}
)
