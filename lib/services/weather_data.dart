import 'location.dart';
import 'access_network.dart';
import 'package:weather_app/utilities/weather_icon.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:flutter/material.dart';

const kAPIkey = ~;
const weatherMapURL = 'https://api.openweathermap.org/data/2.5/';

class Weather {
  Future<dynamic> getCurrentWeatherWithLocation() async {
    Location userLocation = Location();
    await userLocation.getLocation();

    AccessNetwork network = AccessNetwork(
        '${weatherMapURL}weather?lat=${userLocation.latitude}&lon=${userLocation.longitude}&appid=$kAPIkey&units=metric');
    var weatherData = await network.getData();
    return weatherData;
  }

  Future<dynamic> getForecastWeatherWithLocation() async {
    Location userLocation = Location();
    await userLocation.getLocation();

    AccessNetwork network = AccessNetwork(
        '${weatherMapURL}forecast?lat=${userLocation.latitude}&lon=${userLocation.longitude}&appid=$kAPIkey&units=metric');
    var weatherData = await network.getData();
    return weatherData;
  }
  //https://api.openweathermap.org/data/2.5/forecast?lat=55.97&lon=-4.3&appid=813653ef74495808a09ae6c8ff65d4ed&units=metric

  Future<dynamic> getCurrentWeatherWithName(String cityName) async {
    AccessNetwork network = AccessNetwork(
        '${weatherMapURL}weather?q=$cityName&appid=$kAPIkey&units=metric');
    var weatherData = await network.getData();
    return weatherData;
  }

  Future<dynamic> getForecastWeatherWithName(String cityName) async {
    AccessNetwork network = AccessNetwork(
        '${weatherMapURL}forecast?q=$cityName&appid=$kAPIkey&units=metric');
    var weatherData = await network.getData();
    return weatherData;
  }

  WeatherIcon getWeatherIcon(int condition) {
    if (condition >= 200 && condition < 300) {
      return WeatherIcon(WeatherIcons.thunderstorm, Colors.yellow[500]);
    } else if (condition >= 300 && condition < 600) {
      return WeatherIcon(WeatherIcons.rain, Colors.blue[800]);
    } else if (condition >= 600 && condition < 700) {
      return WeatherIcon(WeatherIcons.snow, Colors.lightBlue[200]);
    } else if (condition >= 700 && condition < 800) {
      return WeatherIcon(WeatherIcons.fog, Colors.grey);
    } else if (condition == 800) {
      return WeatherIcon(WeatherIcons.day_sunny, Color(0xFFFFA629));
    } else if (condition == 801) {
      return WeatherIcon(WeatherIcons.day_sunny_overcast, Color(0xFFFFA629));
    } else if (condition > 801) {
      return WeatherIcon(WeatherIcons.cloudy, Colors.grey[400]);
    } else {
      return WeatherIcon(WeatherIcons.alien, Colors.green);
    }
  }

  IconData getWeatherIconData(int condition) {
    if (condition >= 200 && condition < 300) {
      return WeatherIcons.thunderstorm;
    } else if (condition >= 300 && condition < 600) {
      return WeatherIcons.rain;
    } else if (condition >= 600 && condition < 700) {
      return WeatherIcons.snow;
    } else if (condition >= 700 && condition < 800) {
      return WeatherIcons.fog;
    } else if (condition == 800) {
      return WeatherIcons.day_sunny;
    } else if (condition == 801) {
      return WeatherIcons.day_sunny_overcast;
    } else if (condition > 801) {
      return WeatherIcons.cloudy;
    } else {
      return WeatherIcons.alien;
    }
  }
}
