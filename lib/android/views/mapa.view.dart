import 'package:flutter/material.dart';
import 'package:fpa_projeto/globals.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
class MapaView extends StatefulWidget {
  @override
  _MapaViewState createState() => _MapaViewState();
}

class _MapaViewState extends State<MapaView> {


  Set<Marker> markers = new Set<Marker>();
  GoogleMapController mapController;
  LatLng _center = const LatLng(45.521563, -122.677433);

  setMapPosition(title, snippet) {
    mapController.animateCamera(CameraUpdate.newLatLng(_center));
    markers = Set<Marker>();

    final uuid = Uuid();
    Marker marker = Marker(
      markerId: MarkerId('${uuid.v4()}'),
      position: _center,
      infoWindow: InfoWindow(
        title: title,
        snippet: snippet,
      ),
    );

    markers.add(marker);
    setState(() {});
  }

  setCurrentLocation() async {
    Position position = await Geolocator().getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    _center = LatLng(
      position.latitude,
      position.longitude,
    );

    setMapPosition(nomeUsuario, "Posição Atual");
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          color: Theme.of(context).primaryColor,
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 28,
                width: 28,
                child: Image.asset("assets/images/defesa_civil.jpg"),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                  "Meus Chamados"
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 15.0,
                ),
                markers: markers,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
