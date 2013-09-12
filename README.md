#Yahoo Intraday Stock Quote Data
Fetch intraday stock data from yahoo

##Usage
`npm install intraday`
```javascript
var intraday = require('intraday');
var symbol = 'TSLA';

intraday(symbol, function (err, data) {
  console.log(err ? err : data);
});

// or

// previous number of days worth of intraday, defaults to 1 (today)
var numDays = 5;
intraday(symbol, numDays, function (err, data) {
  console.log(err ? err : data);
});

```

You should get an array of objects like:
```javascript
[{
  timestamp: '1378993858', // need to add '000' to get a valid timestamp
  close: '123',
  high: '123',
  low: '123',
  open: '123',
  volume: '1234'
},
...
]
```

