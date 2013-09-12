http = require 'http'
csv = require 'csv'

filt = (value, index, array) ->
  value.length is 6

toObj = (list, values) ->
  ret = []
  for i in [0...values.length]
    res = {}
    for j in [0...list.length]
      res[list[j]] = values[i][j]
    ret.push res
  ret

KEY_RE = /:(.+)$/
clean = (key) ->
  match = key.match KEY_RE
  if match and match.length is 2
    key = match[1].toLowerCase()
  key

module.exports = (symbol, numDays, cb) ->
  return module.exports arguments[0], 1, arguments[1] if arguments.length is 2

  url = "http://chartapi.finance.yahoo.com/instrument/1.0/#{symbol}/chartdata;type=quote;range=#{numDays}d/csv"
  http.get url, (res) ->
    if res.statusCode is 200
      csv().from(res).to.array (data) ->
        values = data.filter filt
        keys = values.shift()
        keys = keys.map clean
        cb? null, toObj keys, values
        null
    else
      cb? res.statusCode, null
    null
  null

