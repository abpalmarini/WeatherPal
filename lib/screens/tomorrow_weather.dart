import 'package:flutter/material.dart';
import 'package:weather_app/utilities/top_bar.dart';
import 'package:weather_app/utilities/weather_cards.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/services/weather_data.dart';
import 'weekly_day_screens.dart';

class TomorrowWeatherScreen extends StatefulWidget {
  final forecastWeatherData;
  final String location;
  final DateTime currentDate;
  final int timeZoneDifference;
  TomorrowWeatherScreen(
      {this.forecastWeatherData,
      this.location,
      this.currentDate,
      this.timeZoneDifference});

  @override
  _TomorrowWeatherScreenState createState() => _TomorrowWeatherScreenState();
}

class _TomorrowWeatherScreenState extends State<TomorrowWeatherScreen> {
  DateTime dateReference;
  int newDayLocationIndex;
  List<int> conditions = [];
  List<DateTime> dateAndTimes = [];
  List<int> temperatures = [];
  Weather weather = Weather();

  void findNewDayLocationIndex(dynamic weatherData) {
    for (int i = 0; i < 9; i++) {
      int epochTime = weatherData['list'][i]['dt'] * 1000;
      dateReference = DateTime.fromMillisecondsSinceEpoch(
          (epochTime + widget.timeZoneDifference));

      if (dateReference.day > widget.currentDate.day ||
          dateReference.month > widget.currentDate.month) {
        newDayLocationIndex = i;
        return;
      }
    }
  }

  void setLists(dynamic weatherData) {
    for (int i = 0; i < 8; i++) {
      conditions.add(
          weatherData['list'][newDayLocationIndex + i]['weather'][0]['id']);
      temperatures.add(
          weatherData['list'][newDayLocationIndex + i]['main']['temp'].round());
      int epochTime = weatherData['list'][newDayLocationIndex + i]['dt'] * 1000;
      dateAndTimes.add(DateTime.fromMillisecondsSinceEpoch(
          (epochTime + widget.timeZoneDifference)));
    }
  }

  String getDisplayTime(int dateMinuteOrHour) {
    if (dateMinuteOrHour < 10) {
      return '0$dateMinuteOrHour';
    } else {
      return '$dateMinuteOrHour';
    }
  }

  @override
  void initState() {
    super.initState();
    findNewDayLocationIndex(widget.forecastWeatherData);
    setLists(widget.forecastWeatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            TopBarBackAndForwards(
              title: 'Tomorrow',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirstDayScreen(
                      forecastWeatherData: widget.forecastWeatherData,
                      location: widget.location,
                      timeZoneDifference: widget.timeZoneDifference,
                      previousNewDayLocation: newDayLocationIndex,
                    ),
                  ),
                );
              },
            ),
            Text(
              '${dateAndTimes[0].day}/${dateAndTimes[0].month}',
              style: kDDMMDisplay,
            ),
            Text(
              widget.location,
              style: kLocationTextStyle,
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: conditions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return HorizontalWeatherCard(
                      temperature: temperatures[index],
                      icon: weather.getWeatherIconData(conditions[index]),
                      time: '${getDisplayTime(dateAndTimes[index].hour)}:00',
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
