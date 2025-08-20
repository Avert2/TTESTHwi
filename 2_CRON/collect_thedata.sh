mkdir -p /home/cron

API_KEY="90d8cd2b5780d05798001d4c6e48011e"
#!/bin/bash

API_KEY="YOUR_API_KEY"
SYMBOL="AAPL,MSFT,GOOGL"
OUTPUT_DIR="/home/cron"

mkdir -p "$OUTPUT_DIR"

DATE=$(date +"%m%d%Y")
HOUR=$(date +"%I:%M%p")
FILENAME="$OUTPUT_DIR/cron_${DATE}_${HOUR}.csv"

RESPONSE=$(curl -s "http://api.marketstack.com/v1/eod?access_key=${API_KEY}&symbols=${SYMBOL}")

if [[ $? -ne 0 || -z "$RESPONSE" ]]; then
    echo "NetworkError: NoData" > "$FILENAME"
    exit 1
fi

ERROR_MSG=$(echo "$RESPONSE" | jq -r '.error.message? // empty')
if [[ -n "$ERROR_MSG" ]]; then
    echo "APIError: $ERROR_MSG" > "$FILENAME"
    exit 1
fi

DATA_ROWS=$(echo "$RESPONSE" | jq -r '.data[]? | [.symbol, .date, .close] | @csv')
if [[ -z "$DATA_ROWS" ]]; then
    echo "NoData: NoClosePrice" > "$FILENAME"
else
    echo "symbol,date,close" > "$FILENAME"
    echo "$DATA_ROWS" >> "$FILENAME"
fi

echo "Saved $FILENAME"

