import 'package:flutter/material.dart';

class ConnectionTile extends StatelessWidget {
  final String name;
  final String headline;
  final VoidCallback? onTap;

  const ConnectionTile({required this.name, required this.headline, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(headline),
      onTap: onTap,
    );
  }
}
