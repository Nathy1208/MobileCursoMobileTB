import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> savePoint({
    required String userId,
    required DateTime timestamp,
    required double lat,
    required double lng,
    required double distanceMeters,
    required String method,
  }) {
    return _db.collection('points').add({
      'userId': userId,
      'timestamp': Timestamp.fromDate(timestamp),
      'lat': lat,
      'lng': lng,
      'distance_meters': distanceMeters,
      'method': method,
    });
  }
}
