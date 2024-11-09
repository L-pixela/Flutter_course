import 'weather_widget.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            WeatherWidget(
              days: DayOfWeek.monday,
              maxTemp: "20°",
              minTemp: "10°",
              forecast: Weather.rainy,
            ),
            WeatherWidget(
              days: DayOfWeek.tuesday,
              maxTemp: "30°",
              minTemp: "20°",
              forecast: Weather.sunny,
            ),
            WeatherWidget(
              days: DayOfWeek.wednesday,
              maxTemp: "10°",
              minTemp: "0°",
              forecast: Weather.snowy,
            ),
            WeatherWidget(
              days: DayOfWeek.thursday,
              maxTemp: "25°",
              minTemp: "15°",
              forecast: Weather.cloudy,
            ),
            WeatherWidget(
              days: DayOfWeek.friday,
              maxTemp: "25°",
              minTemp: "15°",
              forecast: Weather.cloudy,
            ),
            WeatherWidget(
              days: DayOfWeek.saturday,
              maxTemp: "25°",
              minTemp: "15°",
              forecast: Weather.cloudy,
            ),
            WeatherWidget(
              days: DayOfWeek.sunday,
              maxTemp: "5°",
              minTemp: "-5°",
              forecast: Weather.snowy,
            ),
          ],
        ),
      ),
    ),
  ));
}
