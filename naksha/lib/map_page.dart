import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapPage extends StatefulWidget {
  final String startLocationName;
  final String endLocationName;

  const MapPage({
    super.key,
    required this.startLocationName,
    required this.endLocationName,
  });

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng? startLatLng;
  LatLng? endLatLng;

  List<LatLng> routePoints= [];

  final String ors_key = "5b3ce3597851110001cf624836bf719d9b4f4c719224c863452c6a4e";
  
  Future<LatLng?> _getCoordinates(String place)async{
    final url = 
      'https://nominatim.openstreetmap.org/search?q=$place&format=json&limit=1';
    final response = await http.get(
      Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);  
      if (data!=null && data!={}) {
        final lat = double.parse(data[0]['lat']);
        final lon = double.parse(data[0]['lon']);
        return LatLng(lat, lon);
      }
    }
    return null;
  }

  Future <List<LatLng>> _getRoute(LatLng start, LatLng end)async{
    final url = 'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$ors_key&start=${start.longitude},${start.latitude}&end=${end.longitude},${end.latitude}';
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      final data = json.decode(response.body);
      final List cords = data['features'][0]['geometry']['coordinates'];
      return cords.map<LatLng>((c)=> LatLng(c[1], c[0])).toList();
    }else{
      print("Route API failed: ${response.body}");
      return [];
    }
  } 

  Future<void> _loadRoute()async{
    // final startCoords = await
    startLatLng = await _getCoordinates(widget.startLocationName);
    endLatLng = await _getCoordinates(widget.endLocationName);

    if (startLatLng != null && endLatLng !=null) {

      final cords = await _getRoute(startLatLng!, endLatLng!);

      setState(() {
        routePoints = cords;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _loadRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route Map"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: ()=>Navigator.pop(context),
        ),
      ),

      body: (startLatLng == null || endLatLng ==null || routePoints.isEmpty)
        ? Center(child: CircularProgressIndicator(),)
        : FlutterMap(
          options: MapOptions(
            initialCenter: startLatLng!,
            initialZoom: 10 
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a','b','c'],
              userAgentPackageName: 'com.example.app',
            ),

            PolylineLayer(
              polylines: [
                Polyline(
                  points: routePoints,
                  strokeWidth: 4.0,
                  color: Colors.blue,
                )
              ],
            ),

            MarkerLayer(
              markers: [
                Marker(
                  point: startLatLng!, 
                  width: 60,
                  height: 60,
                  child: Icon(Icons.location_pin, color: Colors.green, size: 30,),
                ),

                Marker(
                  point: endLatLng!, 
                  width: 60,
                  height: 60,
                  child: Icon(Icons.location_pin, color: Colors.red, size: 30,),
                ),
              ]
            )
          ]
        )
      ,
    );
  }
}
