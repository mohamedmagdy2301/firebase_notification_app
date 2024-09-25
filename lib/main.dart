import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:notification_app2/firebase_options.dart';
import 'package:notification_app2/notification_helper/firebase_notification_menager.dart';
import 'package:notification_app2/notification_helper/local_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Future.wait([
    FirebaseNotificationMenager.initFirebaseNotification(),
    LocalNotificationService.init(),
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Notification App'),
        ),
        body: Center(
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {},
            child: const Text('Click Me'),
          ),
        ),
      ),
    );
  }
}
