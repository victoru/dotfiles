#!/home/victor/scripts/weatherpy-env/bin/python


import pyowm
import sys

owm = pyowm.OWM('2a24ad0e14e015b0d91f26c7de993bb3')  # You MUST provide a valid API key

# Have a pro subscription? Then use:
# owm = pyowm.OWM(API_key='your-API-key', subscription_type='pro')

# Will it be sunny tomorrow at this time in Milan (Italy) ?
# forecast = owm.daily_forecast("Arlington, TX")
# w = observation.get_weather()
# print(w)                      # <Weather - reference time=2013-12-18 09:20,
# tomorrow = pyowm.timeutils.tomorrow()
# forecast.will_be_sunny_at(tomorrow)  # Always True in Italy, right? ;-)

# Search for current weather in London (UK)
try:
    # observation = owm.weather_at_place('London,uk')
    observation = owm.weather_at_place('Dallas,US')
    w = observation.get_weather()
    # print(w)                      # <Weather - reference time=2013-12-18 09:20,
    # print(w.get_detailed_status())                      # <Weather - reference time=2013-12-18 09:20,
    # print(w.get_sunset_time('iso'))
    # print(w.get_humidity())
    temp = w.get_temperature('fahrenheit')
    status = w.get_detailed_status()
    humidity = w.get_humidity()
    output = ('%.0fF %s - H%s' % (temp['temp'], status, humidity))
except:
    raise
    pass
else:
    print(output)
    sys.exit(0);

sys.exit(1);
                              # status=Clouds>

# Weather details
# w.get_wind()                  # {'speed': 4.6, 'deg': 330}
# w.get_humidity()              # 87
# w.get_temperature('celsius')  # {'temp_max': 10.5, 'temp': 9.7, 'temp_min': 9.0}

# Search current weather observations in the surroundings of
# lat=22.57W, lon=43.12S (Rio de Janeiro, BR)
# observation_list = owm.weather_around_coords(-22.57, -43.12)



# # import pywapi
# # import sys

# # try:
    # # result = pywapi.get_weather_from_noaa(sys.argv[1])
    # # #result = pywapi.get_weather_from_yahoo(sys.argv[1], 'imperial')
# # except:
    # # raise
    # # pass
# # else:
    # # result["temp_f"] = float(result["temp_f"])
    # # output = ('%(temp_f)gF %(weather)s' % result)
    # # print(output)
    # # sys.exit(0);

# # sys.exit(1);
