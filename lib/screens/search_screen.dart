import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/utilities/popular_location_widget.dart';
import 'package:weather_app/utilities/top_bar.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopBarOnlyBack('Search Location'),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                decoration: kTextFieldDecoration,
                cursorColor: Colors.black,
                style: kSubHeaderTextStyle,
                onSubmitted: (value) {
                  cityName = value;
                  Navigator.pop(context, cityName);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 36, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Popular',
                    style: kMainHeaderTextStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      PopularLocationWidget(
                        'Bangkok',
                        Color(0xFFF78A55),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      PopularLocationWidget(
                        'London',
                        Color(0xFFB56290),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      PopularLocationWidget(
                        'Paris',
                        Color(0xFF49567B),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      PopularLocationWidget(
                        'Tokyo',
                        Color(0xFFE26D79),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      PopularLocationWidget(
                        'Istanbul',
                        Color(0xFF7C5E90),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      PopularLocationWidget(
                        'Seoul',
                        Color(0xFF2E4759),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      PopularLocationWidget(
                        'Dubai',
                        Color(0xFFF78A55),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      PopularLocationWidget(
                        'Macau',
                        Color(0xFFB56290),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      PopularLocationWidget(
                        'New York',
                        Color(0xFF49567B),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      PopularLocationWidget(
                        'Osaka',
                        Color(0xFFE26D79),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      PopularLocationWidget(
                        'Rome',
                        Color(0xFF7C5E90),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      PopularLocationWidget(
                        'Sydney',
                        Color(0xFF2E4759),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
//TODO make it so popular city widget text doesn't shrink on smaller screens
