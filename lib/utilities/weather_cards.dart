import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherCard extends StatelessWidget {
  final List<Color> colors;
  final String time;
  final IconData icon;
  final int temperature;

  WeatherCard({this.colors, this.time, this.icon, this.temperature});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: colors,
          stops: kGradientStops,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            time,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'IBM',
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          BoxedIcon(
            icon,
            color: Colors.white,
            size: 50,
          ),
          Text(
            '$temperature°',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'IBM',
              fontWeight: FontWeight.w900,
              fontSize: 22,
            ),
          )
        ],
      ),
    );
  }
}

class HorizontalWeatherCard extends StatelessWidget {
  //final List<Color> colors;
  final String time;
  final IconData icon;
  final int temperature;

  HorizontalWeatherCard({this.time, this.icon, this.temperature});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 36),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: k6Colors,
          stops: k6ColorStops,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            time,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'IBM',
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          BoxedIcon(
            icon,
            color: Colors.white,
            size: 50,
          ),
          Text(
            '  $temperature° ',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'IBM',
              fontWeight: FontWeight.w900,
              fontSize: 22,
            ),
          )
        ],
      ),
    );
  }
}
