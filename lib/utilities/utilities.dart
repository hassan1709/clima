import 'package:clima/utilities/size_config.dart';
import 'package:flutter/material.dart';

const kGoogleAPIkey = 'AIzaSyDOagHnS6ANTgAYztjZeHyCEGi2KbKlRSE';
const kWeatherAPIkey = '4e46f7058416fe295d6d12a2eccc6cc6';
const kOpenWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class Utilities {
  static TextStyle tempTextStyle = TextStyle(
    fontFamily: 'Spartan MB',
    fontSize: SizeConfig.safeBlockHorizontal * 15,
  );

  static TextStyle messageTextStyle = TextStyle(
    fontFamily: 'Spartan MB',
    fontSize: SizeConfig.safeBlockHorizontal * 15,
  );

  static TextStyle buttonTextStyle = TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 10,
    fontFamily: 'Spartan MB',
  );

  static TextStyle conditionTextStyle = TextStyle(
    fontSize: 50.0,
  );

  static InputDecoration textFieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ),
    hintText: 'Enter City Name',
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      borderSide: BorderSide.none,
    ),
  );
}
