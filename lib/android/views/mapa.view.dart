import 'package:flutter/material.dart';
import 'package:fpa_projeto/globals.dart';
import 'package:fpa_projeto/repositories/chamado.repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
class MapaView extends StatefulWidget {
  @override
  _MapaViewState createState() => _MapaViewState();
}

class _MapaViewState extends State<MapaView> {
  BitmapDescriptor pinBlueIcon;
  BitmapDescriptor pinGreenIcon;
  BitmapDescriptor pinYellowIcon;
  BitmapDescriptor pinRedIcon;
  BitmapDescriptor pinPurpleIcon;
  Set<Marker> markers = new Set<Marker>();
  GoogleMapController mapController;
  LatLng _center = const LatLng(45.521563, -122.677433);


  setMapPosition(title, snippet) {
    mapController.animateCamera(CameraUpdate.newLatLng(_center));
    BitmapDescriptor bmd = pinRedIcon;
    if (snippet == "Posição Atual") {
      bmd = pinPurpleIcon;
    }
    final uuid = Uuid();
    Marker marker = Marker(
      markerId: MarkerId('${uuid.v4()}'),
      position: _center,
      icon: bmd,
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

  setLocation(title,snippet,lat,lng) async {
    _center = LatLng(lat,lng,);
    setMapPosition(title, snippet);
  }
  marcaChamados(){
    ChamadoRepository repChamados = new ChamadoRepository();
    repChamados.listarChamados().then((chamados) {
      chamados.forEach((chamado) {
        if (!chamado.latitude.isNaN){
          setLocation(chamado.processo.toString(), chamado.statusChamado, chamado.latitude, chamado.longitude);
        }
      });
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    marcaChamados();
    setCurrentLocation();
  }

  void setCustomMapPin() async {
    pinBlueIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 5.5),
        'assets/images/blue-dot.png');
    pinGreenIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 5.5),
        'assets/images/green-dot.png');
    pinYellowIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 5.5),
        'assets/images/yellow-dot.png');
    pinRedIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 5.5),
        'assets/images/red-dot.png');
    pinPurpleIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 5.5),
        'assets/images/purple-dot.png');
  }

  @override
  void initState() {
    super.initState();
    setCustomMapPin();

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
