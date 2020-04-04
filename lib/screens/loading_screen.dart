import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/services/weather_data.dart';
import 'package:flutter/services.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    getWeatherData();
  }

  void getWeatherData() async {
    Weather weather = Weather();

    dynamic currentWeatherData = await weather.getCurrentWeatherWithLocation();

    dynamic forecastWeatherData =
        await weather.getForecastWeatherWithLocation();

    GeolocationStatus geolocationStatus =
        await Geolocator().checkGeolocationPermissionStatus();

    if (geolocationStatus == GeolocationStatus.granted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                  currentWeatherData: currentWeatherData,
                  forecastWeatherData: forecastWeatherData,
                )),
      );
    } else {
      dynamic currentWeatherDataNoLocation =
          await weather.getCurrentWeatherWithName('London');

      dynamic forecastWeatherDataNoLocation =
          await weather.getForecastWeatherWithName('London');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                  currentWeatherData: currentWeatherDataNoLocation,
                  forecastWeatherData: forecastWeatherDataNoLocation,
                )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitDoubleBounce(
          color: Color(0xFF7C5E90),
          size: 100,
        ),
      ),
    );
  }
}
