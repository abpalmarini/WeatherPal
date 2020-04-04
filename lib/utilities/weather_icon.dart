import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  WeatherIcon(this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    return BoxedIcon(
      icon,
      size: 55,
      color: color,
    );
  }
}
