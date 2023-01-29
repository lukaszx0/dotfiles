#!/bin/bash
export PATH="/usr/local/bin:$PATH"
RATE=$(curl -s "https://api.nbp.pl/api/exchangerates/rates/a/usd/last/?format=json" | jq '.rates[0].mid' | xargs printf '%.*f\n' 2)

echo "USD: $RATE"
