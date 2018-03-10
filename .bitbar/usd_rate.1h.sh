#!/bin/bash
export PATH="/usr/local/bin:$PATH"
RATE=$(curl -s https://currency-api.appspot.com/api/USD/PLN.json | jq .rate | xargs printf '%.*f\n' 2)

echo "USD: $RATE"
