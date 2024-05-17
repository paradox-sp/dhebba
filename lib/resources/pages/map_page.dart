import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'dart:convert';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
// import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math';
import 'dart:async';

class MapPage extends NyStatefulWidget {
  static const path = '/map';

  MapPage({super.key}) : super(path, child: _MapPageState());
}

class _MapPageState extends NyState<MapPage> {
  late final MapController _mapController;
  // final List<Marker> _markers = [];
  // List<LatLng> _routePoints = [];
  // bool _isLoading = false;
  // double _distance = 0.0; // Add this line to store the distance
  // double? _compassDirection;

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
    // FlutterCompass.events!.listen((CompassEvent event) {
    //   setState(() {
    //     _compassDirection = event.heading;
    //   });
    // });
  }

  void _initializeMarker() {
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
  // void _onMapTap(LatLng position) {
  //   if (_markers.length < 2) {
  //     _addMarker(position);
  //   } else {
  //     _clearRoute();
  //     _addMarker(position);
  //   }
  // }

  // void _addMarker(LatLng position) {
  //   setState(() {
  //     _markers.add(Marker(
  //       point: position,
  //       width: 80,
  //       height: 80,
  //       child: const Icon(Icons.location_on,
  //           color: Colors.red, size: 40), // Corrected line
  //     ));
  //   });
  //   // if (_markers.length == 2) {
  //   //   _fetchRoute();
  //   // }
  // }

  // Future<void> _fetchRoute() async {
  //   setState(() => _isLoading = true);

  //   const apiKey =
  //       '5b3ce3597851110001cf62487c2f31c4d7454f4482a7b153f28d779f'; // Replace with your OpenRouteService API key
  //   final start = _markers[0].point;
  //   final end = _markers[1].point;
  //   final response = await http.get(Uri.parse(
  //       'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apiKey&start=${start.longitude},${start.latitude}&end=${end.longitude},${end.latitude}'));

  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body);
  //     final coordinates =
  //         data['features'][0]['geometry']['coordinates'] as List;
  //     _routePoints = coordinates.map((c) => LatLng(c[1], c[0])).toList();
  //   } else {
  //     print('Failed to fetch route: ${response.body}');
  //   }
  //   // After fetching the route, calculate the distance if there are at least two markers
  //   if (_markers.length >= 2) {
  //     // ignore: prefer_const_constructors
  //     final Distance distance = Distance();
  //     // Assuming _markers[0] is the start point and _markers[1] is the end point
  //     _distance = distance(
  //       LatLng(_markers[0].point.latitude, _markers[0].point.longitude),
  //       LatLng(_markers[1].point.latitude, _markers[1].point.longitude),
  //     );
  //   }
  //   setState(() => _isLoading = false);
  // }

  // void _clearRoute() {
  //   setState(() {
  //     _markers.clear();
  //     _routePoints.clear();
  //   });
  // }

  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: const LatLng(28.3949, 84.1240),
              zoom: 8,
              // onTap: (_, latLng) => _onMapTap(latLng),
            ),
            // Move the layers inside MapOptions
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
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
