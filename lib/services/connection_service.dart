class ConnectionService {
  Map<String, List<String>> _connections = {
    '1': ['2'],
    '2': ['1'],
  };

  List<String> getConnections(String userId) => _connections[userId] ?? [];
  void connect(String userId, String otherId) {
    _connections.putIfAbsent(userId, () => []).add(otherId);
    _connections.putIfAbsent(otherId, () => []).add(userId);
  }
}
