import 'package:flutter/material.dart';

import 'Geofence.dart';


class GeofenceApp extends StatelessWidget {
  final GeofenceServiceManager geofenceServiceManager;

  GeofenceApp(this.geofenceServiceManager);

  @override
  Widget build(BuildContext context) {
    return MyApp(geofenceServiceManager);
  }
}

class MyApp extends StatelessWidget {
  final GeofenceServiceManager geofenceServiceManager;

  MyApp(this.geofenceServiceManager);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geofence Notifications'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                TextButton.icon(
                    onPressed: () {
                      pauseService();
                    },
                    icon: const Icon(Icons.pause),
                    label: const Text("PAUSE FOR 24 HOURS")),
                const SizedBox(
                  width: 30,
                ),
                TextButton.icon(
                    onPressed: () {
                      resumeService();
                    },
                    icon: const Icon(Icons.start),
                    label: const Text("RESUME"))
              ],
            ),
            const SizedBox(
              height: 100,
            ),
             StreamBuilder<Activity>(
             // stream: _activityStreamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  double speedInMph = (snapshot.data!.speed * 2.23694);
                  return Text(
                    speedInMph.toStringAsFixed(2),
                    style: const TextStyle(fontSize: 100),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),

          ],
        ),
      ),
    );
  }
}
