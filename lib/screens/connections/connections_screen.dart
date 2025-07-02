import 'package:flutter/material.dart';
import '../../widgets/connection_tile.dart';

class ConnectionsScreen extends StatelessWidget {
  final List<Map<String, String>> _connections = const [
    {
      'name': 'Morty Smith',
      'headline': 'Flutter Developer at CityUHK'
    },
    {
      'name': 'Bob Lee',
      'headline': 'Year 3 Computer Science Student'
    },
    {
      'name': 'Charlie Kim',
      'headline': 'Mobile Team Lead'
    },
    {
      'name': 'Diana Smith',
      'headline': 'UI/UX Designer'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Connections')),
      body: ListView.builder(
        itemCount: _connections.length,
        itemBuilder: (context, index) {
          final conn = _connections[index];
          return ConnectionTile(
            name: conn['name']!,
            headline: conn['headline']!,
            onTap: () {},
          );
        },
      ),
    );
  }
}
