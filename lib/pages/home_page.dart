import 'package:app_store/pages/app_details_page.dart';
import 'package:flutter/material.dart';
import '../models/app_model.dart';
import 'apps_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: const Text('Download My Apps'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search apps...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: demoApps.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .75,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final app = demoApps[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AppsPage(app: app)),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundImage: NetworkImage(app.icon),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            app.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              app.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AppDetailsPage(app: app),
                                ),
                              );
                            },
                            child: const Text('Download APK'),
                          ),
                        ],
                      ),
                    ),
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

/// demo data
final demoApps = [
  AppModel(
    name: 'E-commerce App',
    description: 'Online shopping App',
    version: 'v1.0',
    size: '12 MB',
    icon: 'https://cdn-icons-png.flaticon.com/512/3081/3081559.png',
    apkUrl:
        'https://drive.usercontent.google.com/download?id=1fP2T_eQalxteHK9mLaUC2FodQwht2LCx&export=download&authuser=0',
  ),

  AppModel(
    name: 'Chat App',
    description: 'Unic Chat App',
    version: 'v1.0',
    size: '72 MB',
    icon: 'https://cdn-icons-png.flaticon.com/512/1041/1041916.png',
    apkUrl:
        'https://drive.usercontent.google.com/download?id=1f6a_xPkBJIXOvMgTklF0TUVXWjprCALX&export=download',
  ),
];
