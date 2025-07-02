class AppNotification {
  final String id;
  final String userId;
  final String message;
  final DateTime timestamp;
  final bool read;

  AppNotification({
    required this.id,
    required this.userId,
    required this.message,
    required this.timestamp,
    required this.read,
  });
}
