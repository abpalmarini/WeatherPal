import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';

class TemperatureDisplay extends StatelessWidget {
  final double temperature;
  TemperatureDisplay(this.temperature);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '°',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
              color: Color(0xFFFFFFFF)),
        ),
        Text(
          temperature.toStringAsFixed(1),
          style: kTemperatureStyle,
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Text(
              '°',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w100,
                fontFamily: 'Chivo',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
