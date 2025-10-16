import 'package:flutter/material.dart';
import '../services/geo_service.dart';
import '../services/firestore_service.dart';

class PointController extends ChangeNotifier {
  final GeoService geo = GeoService();
  final FirestoreService db = FirestoreService();

  double? lastDistance;
  bool insideRadius = false;

  Future<void> checkDistance(double workplaceLat, double workplaceLng) async {
    try {
      final pos = await geo.getCurrentPosition();
      final dist = await geo.distanceMeters(pos.latitude, pos.longitude, workplaceLat, workplaceLng);
      lastDistance = dist;
      insideRadius = dist <= 100;
      notifyListeners();
    } catch (e) {
      print('Geo error: \$e');
      lastDistance = null;
      insideRadius = false;
      notifyListeners();
    }
  }

  Future<void> savePoint(String userId, double lat, double lng, double dist, String method) {
    return db.savePoint(
      userId: userId,
      timestamp: DateTime.now(),
      lat: lat,
      lng: lng,
      distanceMeters: dist,
      method: method,
    );
  }
}
