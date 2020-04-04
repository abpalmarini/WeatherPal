import 'package:flutter/material.dart';

const kTitleTextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 15,
);

const kTemperatureStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w500,
  fontSize: 59,
  fontFamily: 'Mitr',
);

const kLocationTextStyle = TextStyle(
  color: Color(0xFF757B7E),
  fontSize: 21,
  fontFamily: 'IBM',
);

const kMainHeaderTextStyle = TextStyle(
  fontSize: 23,
  fontFamily: 'IBMbold',
);

const kSubHeaderTextStyle = TextStyle(
  fontFamily: 'IBMsemibold',
  fontSize: 15,
);

const kSubAnswerTextStyle = TextStyle(
  fontFamily: 'IBMsemibold',
  fontSize: 15,
  color: Color(0x44000000),
);

const kButtonTextStyle = TextStyle(
  fontFamily: 'IBMsemibold',
  fontSize: 14,
  color: Colors.white,
);

const kDDMMDisplay = TextStyle(
  fontFamily: 'Mitr',
  fontSize: 35,
);

const List<double> kGradientStops = [
  0,
  0.50,
  0.50,
  1,
];

const List<Color> kBox1colors = [
  Color(0xFFF78A55),
  Color(0xFFF78A55),
  Color(0xFFE26D79),
  Color(0xFFE26D79),
];

const List<Color> kBox2colors = [
  Color(0xFFB56290),
  Color(0xFFB56290),
  Color(0xFF7C5E90),
  Color(0xFF7C5E90),
];

const List<Color> kBox3colors = [
  Color(0xFF49567B),
  Color(0xFF49567B),
  Color(0xFF2E4759),
  Color(0xFF2E4759),
];

const List<double> k6ColorStops = [
  0,
  0.17,
  0.17,
  0.34,
  0.34,
  0.5,
  0.5,
  0.67,
  0.67,
  0.84,
  0.84,
  1,
];

const List<Color> k6Colors = [
  Color(0xFFF78A55),
  Color(0xFFF78A55),
  Color(0xFFE26D79),
  Color(0xFFE26D79),
  Color(0xFFB56290),
  Color(0xFFB56290),
  Color(0xFF7C5E90),
  Color(0xFF7C5E90),
  Color(0xFF49567B),
  Color(0xFF49567B),
  Color(0xFF2E4759),
  Color(0xFF2E4759),
];

const kTextFieldDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
  ),
  icon: Icon(
    Icons.location_city,
    size: 32,
    //color: Color(0xFF757B7E),
  ),
  filled: true,
  fillColor: Color(0x11000000),
  contentPadding: EdgeInsets.symmetric(horizontal: 15),
  hintText: 'Enter City name',
  hintStyle: kSubAnswerTextStyle,
);
