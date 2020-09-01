import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
GoogleMapController mapController;
double lat = -8.0485375;
double long = -34.8969287;

void _onMapCreated(GoogleMapController controller){
  mapController = controller;

}
class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Google Maps"
        ),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        onCameraMove: (data){
          print(data);
        },
        onTap: (position){
          print(position);
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(lat,long),
          zoom: 11.0
        ),
      ),
    );
  }
}
