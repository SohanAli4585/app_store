import 'package:flutter/material.dart';
import '../models/app_model.dart';

class AppsPage extends StatelessWidget {
  final AppModel app;
  const AppsPage({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(app.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(app.icon),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              app.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(app.description),
            const Divider(height: 32),
            Text('Version: ${app.version}'),
            Text('File Size: ${app.size}'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.download),
                label: const Text('Download APK'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Download started...')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
