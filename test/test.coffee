intraday = require '../src/intraday'
assert = require 'assert'

intraday 'TSLA', (err, data) ->
  assert.equal err, null
  console.log data[i] for i in [0..20]
  console.log data.length

