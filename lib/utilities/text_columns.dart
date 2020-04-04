import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';

class HeaderColumn extends StatelessWidget {
  final String topHeader;
  final String middleHeader;
  final String bottomHeader;

  HeaderColumn(
      {@required this.topHeader,
      @required this.middleHeader,
      @required this.bottomHeader});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              topHeader,
              style: kSubHeaderTextStyle,
            ),
          ),
          Expanded(
            child: Text(
              middleHeader,
              style: kSubHeaderTextStyle,
            ),
          ),
          Expanded(
            child: Text(
              bottomHeader,
              style: kSubHeaderTextStyle,
            ),
          ),
        ]);
  }
}

class AnswerColumn extends StatelessWidget {
  final String topHeader;
  final String middleHeader;
  final String bottomHeader;

  AnswerColumn(
      {@required this.topHeader,
      @required this.middleHeader,
      @required this.bottomHeader});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              topHeader,
              style: kSubAnswerTextStyle,
            ),
          ),
          Expanded(
            child: Text(
              middleHeader,
              style: kSubAnswerTextStyle,
            ),
          ),
          Expanded(
            child: Text(
              bottomHeader,
              style: kSubAnswerTextStyle,
            ),
          )
        ]);
  }
}

//
//@override
//Widget build(BuildContext context) {
//  return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      children: <Widget>[
//        Text(
//          topHeader,
//          style: kSubAnswerTextStyle,
//        ),
//        SizedBox(
//          height: 20,
//        ),
//        Text(
//          middleHeader,
//          style: kSubAnswerTextStyle,
//        ),
//        SizedBox(
//          height: 20,
//        ),
//        Text(
//          bottomHeader,
//          style: kSubAnswerTextStyle,
//        )
//      ]);
//}
//}

//@override
//Widget build(BuildContext context) {
//  return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      children: <Widget>[
//        Text(
//          topHeader,
//          style: kSubHeaderTextStyle,
//        ),
//        SizedBox(
//          height: 20,
//        ),
//        Text(
//          middleHeader,
//          style: kSubHeaderTextStyle,
//        ),
//        SizedBox(
//          height: 20,
//        ),
//        Text(
//          bottomHeader,
//          style: kSubHeaderTextStyle,
//        ),
//      ]);
//}
//}
