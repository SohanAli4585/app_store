import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/app_model.dart';

class AppDetailsPage extends StatelessWidget {
  final AppModel app;
  const AppDetailsPage({super.key, required this.app});

  // Download function
  Future<void> _downloadApk(BuildContext context) async {
    final uri = Uri.parse(app.apkUrl);

    try {
      // Launch external browser
      if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open the download link.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error occurred: $e')));
    }
  }

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
            const SizedBox(height: 20),
            Text(
              app.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(app.description, style: const TextStyle(fontSize: 16)),
            const Divider(height: 32),
            Text(
              'Version: ${app.version}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'File Size: ${app.size}',
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.download),
                label: const Text('Download APK'),
                onPressed: () => _downloadApk(context),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
