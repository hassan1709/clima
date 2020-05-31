import 'package:clima/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/utilities.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleAPIkey);
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: SizeConfig.safeBlockHorizontal * 10,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(
                  SizeConfig.safeBlockHorizontal * 5,
                ),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: Utilities.textFieldInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Text(
                  'Get Weather',
                  style: Utilities.buttonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
