import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'constants.dart';

class AppIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: k6Colors,
              stops: k6ColorStops,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: BoxedIcon(
            WeatherIcons.day_sunny_overcast,
            color: Colors.white,
            size: 150,
          ),
        ),
      ),
    );
  }
}
