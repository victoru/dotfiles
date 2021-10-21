#!/bin/bash
uptime | sed 's/^.*average:\s//' | sed 's/,//g' 
