#!/home/victor/scripts/weatherpy-env/bin/python
import pywapi
import sys

try:
    result = pywapi.get_weather_from_noaa(sys.argv[1])
    #result = pywapi.get_weather_from_yahoo(sys.argv[1], 'imperial')
except:
    raise
    pass
else:
    result["temp_f"] = float(result["temp_f"])
    output = ('%(temp_f)gF %(weather)s' % result)
    print(output)
    sys.exit(0);

sys.exit(1);
