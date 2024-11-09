// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

enum Weather {
  sunny("weather_bonus/sunny.png"),
  rainy("weather_bonus/rainy.png"),
  cloudy("weather_bonus/partly_cloudy.png"),
  snowy("weather_bonus/snowy.png");

  final String _weather;
  String get weather => _weather;
  const Weather(this._weather);
}

enum DayOfWeek {
  monday("Mon"),
  tuesday("Tue"),
  wednesday("Wed"),
  thursday("Thu"),
  friday("Fri"),
  saturday("Sat"),
  sunday("Sun");

  final String _days;
  String get day => _days;
  const DayOfWeek(this._days);

  @override
  String toString() => day;
}

class WeatherWidget extends StatelessWidget {
  DayOfWeek days;
  Weather forecast;
  String minTemp;
  String maxTemp;
  WeatherWidget(
      {required this.days,
      required this.forecast,
      required this.maxTemp,
      required this.minTemp,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.only(top: 5, left: 4, right: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2))
              ]),
          height: 160,
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  days._days,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5, left: 5, right: 5),
                child: Image(
                  image: AssetImage(forecast._weather),
                  height: 50,
                  width: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        maxTemp,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        minTemp,
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
