class Weather{
  final String city;
  final double temprature;
  final String mainCondition;

  Weather({
    required this.city,
    required this.temprature,
    required this.mainCondition,
  });

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      city: json["name"], 
      temprature: json["main"]["temp"].toDouble(), 
      mainCondition: json["weather"][0]["main"]
    );
  }
}