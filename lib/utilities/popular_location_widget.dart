import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';

class PopularLocationWidget extends StatelessWidget {
  final String locationName;
  final Color color;

  PopularLocationWidget(this.locationName, this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RaisedButton(
        onPressed: () {
          Navigator.pop(context, locationName);
        },
        shape: StadiumBorder(),
        color: color,
        child: Text(
          locationName,
          style: kButtonTextStyle,
        ),
      ),
    );
  }
}
