import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;
import 'package:weathersense/models/weather_model.dart';

class WeatherService {
  static const base_url="https://api.openweathermap.org/data/2.5/weather";
  final String apiKey;

  WeatherService({
    required this.apiKey
  });

  Future<Weather> getWeather(String city) async {
    final response= await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey"));

    if (response.statusCode==200) {
      return Weather.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("Failed to load weather data.");
    } 
  }

  Future<String> getCurrentCity()async{
    try {
      // get permission from user
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission==LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      // fetch the current location 
      Position position=await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high,
      );
      if (kIsWeb) {
        // 🌍 Skip reverse geocoding on web (it often fails)
        print("${position.latitude }, ${position.longitude}");
        return getCityFromCoordinates(position.latitude, position.longitude);
      }
      //convert the location into a list of placemark objects
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude, position.longitude
      );

      // extract the city name from the first place mark
      String? city=placemarks[0].locality.toString();

      return city??"null";
    } catch (e) {
      print(e);
      return "Delhi";
    }
  }

  Future<String> getCityFromCoordinates(double lat, double lng) async {
  final url = Uri.parse("https://nominatim.openstreetmap.org/reverse?format=json&lat=$lat&lon=$lng");
  
  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String? city = data["address"]["city"] ?? data["address"]["town"] ?? data["address"]["village"];
      print("🏙 OpenStreetMap City: $city");
      return city ?? "Unknown City";
    } else {
      print("❌ OpenStreetMap request failed.");
      return "Unknown City";
    }
  } catch (e) {
    print("❌ OpenStreetMap API error: $e");
    return "Unknown City";
  }
}
}