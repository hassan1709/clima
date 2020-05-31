import 'package:flutter/material.dart';
import 'package:clima/utilities/utilities.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/size_config.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  String weatherIcon;
  String weatherMsg;
  int temperature;
  String cityName;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMsg = 'Unable to get weather data';
        cityName = 'here';
        return;
      }

      var condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      var temp = weatherData['main']['temp'];

      temperature = temp.toInt();

      weatherIcon = weather.getWeatherIcon(condition);
      weatherMsg = weather.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: SizeConfig.safeBlockHorizontal * 10,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedCityName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return CityScreen();
                        }),
                      );

                      if (typedCityName != null) {
                        var weatherData =
                            await weather.getCityWeather(typedCityName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: SizeConfig.safeBlockHorizontal * 10,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.safeBlockHorizontal * 5,
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: Utilities.tempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: SizeConfig.safeBlockHorizontal * 5,
                ),
                child: Text(
                  '$weatherMsg in $cityName',
                  textAlign: TextAlign.right,
                  style: Utilities.messageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
