import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.separated(
          itemCount: 4,
          itemBuilder: (context, index) {
            final items = [
              {'icon': Icons.store, 'title': 'Set Market', 'onTap': () {}},
              {'icon': Icons.devices, 'title': 'Device', 'onTap': () {}},
              {'icon': Icons.delete, 'title': 'Clear Data', 'onTap': () {}},
              {'icon': Icons.sync, 'title': 'Sync Data', 'onTap': () {}},
            ];
            return ListTile(
              leading: Icon(items[index]['icon'] as IconData),
              title: Text(items[index]['title'] as String),
              onTap: items[index]['onTap'] as void Function(),
            );
          },
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Divider(),
          ),
        ),
      ),
    );
  }
}
