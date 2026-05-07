#!/bin/bash
RESPONSES=""
for i in {1..9}; do
  RESPONSES="$RESPONSES $(curl -s http://localhost | grep -o 'App-[0-9]')"
done

COUNT1=$(echo "$RESPONSES" | grep -o "App-1" | wc -l)
COUNT2=$(echo "$RESPONSES" | grep -o "App-2" | wc -l)
COUNT3=$(echo "$RESPONSES" | grep -o "App-3" | wc -l)

if [ "$COUNT1" -ge 1 ] && [ "$COUNT2" -ge 1 ] && [ "$COUNT3" -ge 1 ]; then
  echo "Round Robin terkonfirmasi! Distribution: App-1=$COUNT1 App-2=$COUNT2 App-3=$COUNT3"
  exit 0
else
  echo "Traffic tidak terdistribusi ke semua backend. App-1=$COUNT1 App-2=$COUNT2 App-3=$COUNT3"
  exit 1
fi
