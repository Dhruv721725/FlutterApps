import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:weathersense/models/weather_model.dart';
import 'package:weathersense/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  
  // api key 
  final _weatherService = WeatherService(apiKey:"52365d9a6bf5ae13760a2f148e3d5e77");
  Weather? _weather;
  // fetch weather
  _fetchWeather()async{
    // get the current city
    String cityName = await _weatherService.getCurrentCity();
    // get weather for this city
    try {
      final weather=await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
    // 
  }
  //  weather animation
  String weatherCondition(String? mainCondition){
    if (mainCondition==null) return 'assets/sunny.json';
    switch (mainCondition.toLowerCase()) {
      case "clear":
        return 'assets/sunny.json';
      case "mist":
        return 'assets/mist.json';
      case "clouds":
        return 'assets/windy.json';
      case "rain":
        return 'assets/rainy_day.json';
      case "drizzle":
        return 'assets/sunny.json';
      case "thunderstorm":
        return 'assets/thunder.json';
      case "snow":
        return 'assets/snow.json';
      case "smoke":
        return 'assets/mist.json';
      case "haze":
        return 'assets/mist.json';
      case "dust":
        return 'assets/sunny.json';
      case "fog":
        return 'assets/sunny.json';
      case "sand":
        return 'assets/sunny.json';
      case "ash":
        return 'assets/sunny.json';
      case "squall":
        return 'assets/sunny.json';
      case "tornado":
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  // init state
  @override
  void initState(){
    super.initState();

    // fetch weather on startup
    _fetchWeather();
  }
  @override
  Widget build(BuildContext context) {
    int? temp=_weather?.temprature.round();
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // city name
            Text(_weather?.city ?? "loading city..."),
            
            //animation
            Lottie.asset(weatherCondition(_weather?.mainCondition)),

            // temprature
            Text("${temp==null? "loading temprature...":temp-273 } *C"),

            // weather condition
            Text("${_weather?.mainCondition?? "loading weather"}"),
          ],
        ),
      ),
    );
  }
}