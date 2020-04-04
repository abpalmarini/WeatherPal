import 'package:flutter/material.dart';
import 'package:weather_app/utilities/top_bar.dart';
import 'package:weather_app/utilities/weather_cards.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/services/weather_data.dart';

class FirstDayScreen extends StatefulWidget {
  final forecastWeatherData;
  final String location;
  final int timeZoneDifference;
  final int previousNewDayLocation;
  FirstDayScreen(
      {this.forecastWeatherData,
      this.location,
      this.timeZoneDifference,
      this.previousNewDayLocation});

  @override
  _FirstDayScreenState createState() => _FirstDayScreenState();
}

class _FirstDayScreenState extends State<FirstDayScreen> {
  int newDayLocationIndex;
  List<int> conditions = [];
  List<DateTime> dateAndTimes = [];
  List<int> temperatures = [];
  Weather weather = Weather();

  void findNewDayLocationIndex(int previousNewDayLocation) {
    newDayLocationIndex = previousNewDayLocation + 8;
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
    findNewDayLocationIndex(widget.previousNewDayLocation);
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
              title: '2 Days From Now',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondDayScreen(
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

class SecondDayScreen extends StatefulWidget {
  final forecastWeatherData;
  final String location;
  final int timeZoneDifference;
  final int previousNewDayLocation;
  SecondDayScreen(
      {this.forecastWeatherData,
      this.location,
      this.timeZoneDifference,
      this.previousNewDayLocation});

  @override
  _SecondDayScreenState createState() => _SecondDayScreenState();
}

class _SecondDayScreenState extends State<SecondDayScreen> {
  int newDayLocationIndex;
  List<int> conditions = [];
  List<DateTime> dateAndTimes = [];
  List<int> temperatures = [];
  Weather weather = Weather();

  void findNewDayLocationIndex(int previousNewDayLocation) {
    newDayLocationIndex = previousNewDayLocation + 8;
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
    findNewDayLocationIndex(widget.previousNewDayLocation);
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
              title: '3 Days From Now',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThirdDayScreen(
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

class ThirdDayScreen extends StatefulWidget {
  final forecastWeatherData;
  final String location;
  final int timeZoneDifference;
  final int previousNewDayLocation;
  ThirdDayScreen(
      {this.forecastWeatherData,
      this.location,
      this.timeZoneDifference,
      this.previousNewDayLocation});

  @override
  _ThirdDayScreenState createState() => _ThirdDayScreenState();
}

class _ThirdDayScreenState extends State<ThirdDayScreen> {
  int newDayLocationIndex;
  List<int> conditions = [];
  List<DateTime> dateAndTimes = [];
  List<int> temperatures = [];
  Weather weather = Weather();

  void findNewDayLocationIndex(int previousNewDayLocation) {
    newDayLocationIndex = previousNewDayLocation + 8;
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
    findNewDayLocationIndex(widget.previousNewDayLocation);
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
            TopBarOnlyBack(
              '4 Days From Now',
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

//TODO add a home button on weekly forecasts to quickly get back to home screen
