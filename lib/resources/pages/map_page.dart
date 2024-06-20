import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
// import 'dart:convert';
import 'package:flutter_map/flutter_map.dart';
// import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

// import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math';
import 'dart:async';
// import 'package:location/location.dart';

class MapPage extends NyStatefulWidget {
  static const path = '/map';

  MapPage({super.key}) : super(path, child: _MapPageState());
}

class _MapPageState extends NyState<MapPage> {
  late final MapController _mapController;
  // final Location location = Location();
  // LatLng? currentLocation;
  // List<Marker> markers = [];

  Random random = new Random();
  List<Marker> _markers = [];
  double minLat = -90.0;
  double maxLat = 90.0;
  double minLong = -180.0;
  double maxLong = 180.0;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _initializeMarker();
    startMovingMarker();
  }

  // Future<bool> requestPermission() async {
  //   final permission = await location.requestPermission();
  //   return permission == PermissionStatus.granted;
  // }

  // Future<LocationData> getCurrentLocation() async {
  //   final serviceEnabled = await location.serviceEnabled();
  //   if (!serviceEnabled) {
  //     final result = await location.requestService();
  //     if (!result) {
  //       throw Exception('GPS service not enabled');
  //     }
  //   }
  //   return await location.getLocation();
  // }

  Future<void> _initializeMarker() async {
    setState(() {
      _markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: LatLng(28.3949, 84.1240), // Initial position
          child: Container(
            child: Icon(
              Icons.pin_drop,
              color: Colors.red,
            ),
          ),
        ),
      );
    });
  }

  void startMovingMarker() {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      _moveMarker(LatLng(nextDoubleInRange(minLat, maxLat),
          nextDoubleInRange(minLong, maxLong)));
    });
  }

  double nextDoubleInRange(double min, double max) {
    return min + random.nextDouble() * (max - min);
  }

  void _moveMarker(LatLng newPosition) {
    setState(() {
      LatLng currentPosition = _markers[0].point;
      LatLng newPosition = LatLng(currentPosition.latitude + 0.00009,
          currentPosition.longitude + 0.00009);

      _markers[0] = Marker(
        width: 80.0,
        height: 80.0,
        point: newPosition,
        child: Container(
          child: Icon(
            Icons.bus_alert_outlined,
            color: Colors.red,
          ),
        ),
      );
    });
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: const LatLng(28.3949, 84.1240),
              initialZoom: 8,
              // onTap: (_, latLng) => _onMapTap(latLng),
            ),
            // Move the layers inside MapOptions
            children: [
              TileLayer(
                urlTemplate: getEnv('MAP_URL'),
                // subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(markers: _markers),
              // PolylineLayer(
              //   polylines: [
              //     Polyline(
              //         points: _routePoints, strokeWidth: 4, color: Colors.blue),
              //   ],
              // ),
            ],
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     if (await requestPermission()) {
      //       final locationData = await getCurrentLocation();
      //       setState(() {
      //         currentLocation = LatLng(locationData.latitude!, locationData.longitude!);
      //         markers.add(Marker(
      //           width: 80.0,
      //           height: 80.0,
      //           point: currentLocation!,
      //           builder: (ctx) => Icon(Icons.location_on, color: Colors.red),
      //         ));
      //       });
      //     }
      //   },
      //   child: Icon(Icons.location_searching),
      // ),
    );
    // if (_isLoading) const Center(child: CircularProgressIndicator()),
    // Positioned(
    //   top: 20.0,
    //   right: 20.0,
    //   child: Container(
    //     padding: const EdgeInsets.all(8.0),
    //     color: Colors.white,
    //     child: Text(
    //       'Distance: ${_distance.toStringAsFixed(2)} meters',
    //       style: const TextStyle(fontSize: 16),
    //     ),
    //   ),
    // ),
    //     Positioned(
    //       top: 70.0,
    //       right: 20.0,
    //       child: _compassDirection != null
    //           ? Transform.rotate(
    //               angle: -_compassDirection! *
    //                   (math.pi / 180), // Convert degrees to radians
    //               child: const Stack(
    //                 alignment: Alignment.center,
    //                 children: [
    //                   Icon(Icons.explore,
    //                       size: 60, color: Colors.black), // Compass icon
    //                   CustomPaint(
    //                     size: Size(60, 60), // Match the icon size
    //                     // painter:
    //                     //     NorthIndicatorPainter(), // Custom painter for north indicator
    //                   ),
    //                 ],
    //               ),
    //             )
    //           : Icon(Icons.explore,
    //               color: Colors
    //                   .grey), // Shows a greyed-out icon if the compass is not available
    //     ),
    //   ],
    // ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _clearRoute,
    //     tooltip: 'Clear Route',
    //     child: const Icon(Icons.clear),
    //   ),
    // );
  }
}
