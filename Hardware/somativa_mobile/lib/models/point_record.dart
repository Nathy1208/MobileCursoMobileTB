class PointRecord {
  final String id;
  final String userId;
  final DateTime timestamp;
  final double lat;
  final double lng;
  final double distanceMeters;
  final String method;

  PointRecord({
    required this.id,
    required this.userId,
    required this.timestamp,
    required this.lat,
    required this.lng,
    required this.distanceMeters,
    required this.method,
  });
}
