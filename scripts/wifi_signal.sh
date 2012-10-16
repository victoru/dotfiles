#!/bin/bash

echo -n $(printf "%.0f" `iwconfig 2>&1 | grep "Link Quality" | awk '{print $2}' | sed 's/.*\=//' | sed 's/\// /' | awk '{print let ($1/$2)*100}'`)
