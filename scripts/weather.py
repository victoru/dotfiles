#!/usr/bin/env python2
import pywapi
import sys

if len(sys.argv) == 2:
    try:
        #result = pywapi.get_weather_from_google(sys.argv[1])
        #result = pywapi.get_weather_from_noaa(sys.argv[1])
        result = pywapi.get_weather_from_yahoo(sys.argv[1], 'non-metric')
    except:
        raise
        pass
    else:
        #current_conditions = result['current_conditions']
        #current_conditions = result
        #current_conditions['url'] = 'http://google.com'
        #output = ('%(url)s/%(icon)s|%(temp_f)sF|%(condition)s' %
        #output = ('%(temp_f)sF|%(weather)s' % result)
        output = '{condition[temp]}{units[temperature]}|{condition[text]}'.format(**result)
        print output
else:
    print "cat|dog|eog"

