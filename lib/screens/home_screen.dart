import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/utilities/temperature_display.dart';
import 'package:weather_app/utilities/weather_cards.dart';
import 'package:weather_app/utilities/text_columns.dart';
import 'package:weather_app/services/weather_data.dart';
import 'tomorrow_weather.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class HomeScreen extends StatefulWidget {
  final currentWeatherData;
  final forecastWeatherData;
  HomeScreen({this.currentWeatherData, this.forecastWeatherData});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  bool reloadShowing = false;
  int condition = 800;
  double temperature = 0.0;
  String cityName = 'Can not find location';
  String country = '';
  double minTemperature = 0.0;
  double maxTemperature = 0.0;
  double windSpeed = 0.0;
  int humidity = 0;
  double latitude = 0.0;
  double longitude = 0.0;
  int timeZoneEpoch = 0;
  DateTime sunrise;
  DateTime sunset;
  // Below are the variables for the forecast weather in the cards
  DateTime forecastDateTime0;
  DateTime forecastDateTime1;
  DateTime forecastDateTime2;
  int forecastCondition0 = 800;
  int forecastCondition1 = 800;
  int forecastCondition2 = 800;
  int forecastTemperature0 = 0;
  int forecastTemperature1 = 0;
  int forecastTemperature2 = 0;

  Weather weather = Weather();

  void updateCurrentWeatherUI(dynamic weatherData) {
    setState(() {
      condition = weatherData['weather'][0]['id'];
      temperature = weatherData['main']['temp'].toDouble();
      cityName = weatherData['name'];
      country = weatherData['sys']['country'];
      minTemperature = weatherData['main']['temp_min'].toDouble();
      maxTemperature = weatherData['main']['temp_max'].toDouble();
      windSpeed = weatherData['wind']['speed'].toDouble();
      humidity = weatherData['main']['humidity'];
      latitude = weatherData['coord']['lat'];
      longitude = weatherData['coord']['lon'];
      timeZoneEpoch = weatherData['timezone'] * 1000;
      int sunriseEpoch = weatherData['sys']['sunrise'] * 1000;
      sunrise =
          DateTime.fromMillisecondsSinceEpoch((sunriseEpoch + timeZoneEpoch));
      int sunsetEpoch = weatherData['sys']['sunset'] * 1000;
      sunset =
          DateTime.fromMillisecondsSinceEpoch((sunsetEpoch + timeZoneEpoch));
    });
  }

  void updateForecastWeatherUI(dynamic weatherData) {
    setState(() {
      int forecastDateTimeEpoch0 = weatherData['list'][0]['dt'] * 1000;
      forecastDateTime0 = DateTime.fromMillisecondsSinceEpoch(
          (forecastDateTimeEpoch0 + timeZoneEpoch));
      int forecastDateTimeEpoch1 = weatherData['list'][1]['dt'] * 1000;
      forecastDateTime1 = DateTime.fromMillisecondsSinceEpoch(
          (forecastDateTimeEpoch1 + timeZoneEpoch));
      int forecastDateTimeEpoch2 = weatherData['list'][2]['dt'] * 1000;
      forecastDateTime2 = DateTime.fromMillisecondsSinceEpoch(
          (forecastDateTimeEpoch2 + timeZoneEpoch));
      forecastCondition0 = weatherData['list'][0]['weather'][0]['id'];
      forecastCondition1 = weatherData['list'][1]['weather'][0]['id'];
      forecastCondition2 = weatherData['list'][2]['weather'][0]['id'];
      forecastTemperature0 = weatherData['list'][0]['main']['temp'].round();
      forecastTemperature1 = weatherData['list'][1]['main']['temp'].round();
      forecastTemperature2 = weatherData['list'][2]['main']['temp'].round();
    });
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
    updateCurrentWeatherUI(widget.currentWeatherData);
    updateForecastWeatherUI(widget.forecastWeatherData);

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    controller.forward();
    controller.addListener(() {
      setState(() {
        print(animation.value);
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: ModalProgressHUD(
        inAsyncCall: reloadShowing,
        opacity: 0.2,
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 22,
                    bottom: 18,
                  ), //need to make bottom smaller for android
                  child: Text(
                    'Weather Forecast',
                    style: kTitleTextStyle,
                  ),
                ),
                weather.getWeatherIcon(condition),
                TemperatureDisplay(animation.value * temperature),
                Text('$cityName, $country', style: kLocationTextStyle),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: WeatherCard(
                            colors: kBox1colors,
                            time:
                                '${getDisplayTime(forecastDateTime0.hour)}:00',
                            icon:
                                weather.getWeatherIconData(forecastCondition0),
                            temperature: forecastTemperature0,
                          ),
                        ),
                        Expanded(
                          child: WeatherCard(
                            colors: kBox2colors,
                            time:
                                '${getDisplayTime(forecastDateTime1.hour)}:00',
                            icon:
                                weather.getWeatherIconData(forecastCondition1),
                            temperature: forecastTemperature1,
                          ),
                        ),
                        Expanded(
                          child: WeatherCard(
                            colors: kBox3colors,
                            time:
                                '${getDisplayTime(forecastDateTime2.hour)}:00',
                            icon:
                                weather.getWeatherIconData(forecastCondition2),
                            temperature: forecastTemperature2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 36),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Additional Info',
                          style: kMainHeaderTextStyle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              HeaderColumn(
                                topHeader: 'Min',
                                middleHeader: 'Wind',
                                bottomHeader: 'Sunrise',
                              ),
                              AnswerColumn(
                                topHeader: '$minTemperature°',
                                middleHeader: '$windSpeed m/s',
                                bottomHeader:
                                    '${getDisplayTime(sunrise.hour)}:${getDisplayTime(sunrise.minute)}',
                              ),
                              HeaderColumn(
                                topHeader: 'Max',
                                middleHeader: 'Humidity',
                                bottomHeader: 'Sunset',
                              ),
                              AnswerColumn(
                                topHeader: '$maxTemperature°',
                                middleHeader: '$humidity%',
                                bottomHeader:
                                    '${getDisplayTime(sunset.hour)}:${getDisplayTime(sunset.minute)}',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () async {
                          setState(() {
                            reloadShowing = true;
                          });
                          var currentWeatherData =
                              await weather.getCurrentWeatherWithLocation();
                          var forecastWeatherData =
                              await weather.getForecastWeatherWithLocation();
                          updateCurrentWeatherUI(currentWeatherData);
                          updateForecastWeatherUI(forecastWeatherData);
                          setState(() {
                            reloadShowing = false;
                          });
                        },
                        child: Icon(
                          Icons.near_me,
                          size: 50,
                          color: Color(0xFFF78A55),
                        ),
                      ),
                      FlatButton(
                        onPressed: () async {
                          setState(() {
                            reloadShowing = true;
                          });
                          var forecastWeatherData =
                              await weather.getForecastWeatherWithName(
                                  cityName != 'New York City'
                                      ? cityName
                                      : 'New York');

                          String location = '$cityName, $country';
                          if (forecastWeatherData != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TomorrowWeatherScreen(
                                  forecastWeatherData: forecastWeatherData,
                                  location: location,
                                  timeZoneDifference: timeZoneEpoch,
                                  currentDate: sunrise,
                                ),
                              ),
                            );
                          }
                          setState(() {
                            reloadShowing = false;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: k6Colors,
                              stops: k6ColorStops,
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: Text(
                            'View Week',
                            style: kButtonTextStyle,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          String cityName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchScreen(),
                            ),
                          );
                          if (cityName != null) {
                            setState(() {
                              reloadShowing = true;
                            });
                            var currentWeatherData = await weather
                                .getCurrentWeatherWithName(cityName);
                            var forecastWeatherData = await weather
                                .getForecastWeatherWithName(cityName);
                            updateCurrentWeatherUI(currentWeatherData);
                            updateForecastWeatherUI(forecastWeatherData);
                            setState(() {
                              reloadShowing = false;
                            });
                          }
                        },
                        child: Icon(
                          Icons.search,
                          size: 50,
                          color: Color(0xFF2E4759),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
