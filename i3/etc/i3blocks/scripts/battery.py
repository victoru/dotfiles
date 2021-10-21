#!/bin/env python
import math
import sys

percentColors = [
    { "pct": 0.0, "color": { "r": 0xff, "g": 0x00, "b": 0 } },
    { "pct": 0.5, "color": { "r": 0xff, "g": 0xff, "b": 0 } },
    { "pct": 1.0, "color": { "r": 0x00, "g": 0xff, "b": 0 } },
]

def getColorForPercentage(pct):
    i = 0
    for i in range(1, len(percentColors)):
        if pct < percentColors[i]["pct"] or i > 2:
            break

    lower = percentColors[i - 1];
    upper = percentColors[i];
    rangePct = (pct - lower["pct"]) / (upper["pct"] - lower["pct"])
    pctLower = 1 - rangePct;
    pctUpper = rangePct;
    color = {
        "r": math.floor(lower["color"]["r"] * pctLower + upper["color"]["r"] * pctUpper),
        "g": math.floor(lower["color"]["g"] * pctLower + upper["color"]["g"] * pctUpper),
        "b": math.floor(lower["color"]["b"] * pctLower + upper["color"]["b"] * pctUpper)
    };
    return '#%02x%02x%02x' % (color["r"], color["g"], color["b"])

if len(sys.argv) > 1:
    print(getColorForPercentage(int(sys.argv[1]) / 100.0))
else:
    for i in range(101):
        print(i, getColorForPercentage(i / 100.0))
