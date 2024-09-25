# Notification App

[![Flutter Version](https://img.shields.io/badge/Flutter-v3.0-blue.svg)](https://flutter.dev/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Notification App** is a mobile application built using **Flutter**, designed to demonstrate the implementation of **push notifications** via **Firebase Cloud Messaging (FCM)**. This application allows users to receive real-time notifications, making it ideal for projects that require timely updates and alerts.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Firebase Configuration](#firebase-configuration)
- [Testing Notifications with Postman](#testing-notifications-with-postman)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

- Integration with **Firebase Cloud Messaging (FCM)** for push notifications.
- Support for both **foreground** and **background** notifications.
- User-friendly interface for managing notifications.
- Lightweight and scalable architecture, suitable for integration into larger projects.

## Installation

To set up the application, follow the steps below:

1. **Clone the repository:**
    ```bash
    git clone https://github.com/mohamedmagdy2301/notification_app2.git
    cd notification_app2
    ```

2. **Install dependencies:**
    ```bash
    flutter pub get
    ```

3. **Connect the app to your Firebase project** (refer to the [Firebase Configuration](#firebase-configuration)).

4. **Run the application:**
    ```bash
    flutter run
    ```

## Firebase Configuration

To configure Firebase and enable push notifications, follow these steps:

1. **Create a Firebase Project:**
   - Navigate to the [Firebase Console](https://console.firebase.google.com/) and create a new project.
   - Add your Android and iOS apps to the Firebase project. Ensure you:
     - Install the Firebase CLI and log in by running `firebase login`.
     - Install the Flutter SDK.
     - Create a Flutter project by running `flutter create`.

   - From any directory, execute the following commands in Bash:
     ```bash
     dart pub global activate flutterfire_cli
     flutterfire configure
     ```
   - For detailed instructions, consult the official [Firebase setup guide](https://firebase.google.com/docs/flutter/setup).

2. **Add Firebase Dependencies:**
   - In your `pubspec.yaml` file, include:
     ```yaml
     dependencies:
       firebase_core: latest_version
       firebase_messaging: latest_version
     ```

3. **Initialize Firebase:**
   - In your `main.dart` file, initialize Firebase and set up Firebase Messaging:
     ```dart
     import 'package:firebase_core/firebase_core.dart';
     import 'package:firebase_messaging/firebase_messaging.dart';

     void main() async {
       WidgetsFlutterBinding.ensureInitialized();
       await Firebase.initializeApp();

       FirebaseMessaging messaging = FirebaseMessaging.instance;
       await messaging.requestPermission();
       runApp(MyApp());
     }

     Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
       await Firebase.initializeApp();
       print("Handling a background message: ${message.messageId}");
     }

     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
     ```

4. **Testing Notifications:**
   - Send test notifications from the Firebase Console by navigating to **Cloud Messaging** and creating a new notification.

## Testing Notifications with Postman

To send Firebase Cloud Messaging (FCM) notifications using **Postman**, follow these steps:

1. Refer to the [FCM API Documentation](https://shorturl.at/A27HG).
2. Access the [Firebase Cloud Messaging API](https://shorturl.at/6fNJB).
3. In the **Body** section, select **raw** and choose **JSON** format. Add the following JSON structure:
   ```json
   {
       "message": {
           // Send notification to a specific user by token
           "token": "<User FCM Token>",
           // Send notification to users by topic
           "topic": "<Your Topic>",
           "notification": {
               "title": "New Message",
               "body": "Message from Postman.",
               "image": "https://plus.unsplash.com/premium_photo-1682309567426-5517a398b4dd?q=80&w=1512&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
           }
       }
   }
   
## Usage

After successful setup, the app will automatically subscribe to Firebase and handle notification events.

- **Foreground Notifications:** Notifications are displayed as in-app messages.
- **Background Notifications:** Notifications are sent to the system tray and handled when the app is in the background or terminated.

You can send test notifications using Firebase's notification console or any REST client by hitting the FCM API.

## Contributing

Contributions are welcome! Feel free to submit a Pull Request with improvements, bug fixes, or new features.

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/my-feature`).
3. Make your changes and commit (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature/my-feature`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

## Contact

For any questions or inquiries, feel free to reach out:

- **GitHub:** [mohamedmagdy2301](https://github.com/mohamedmagdy2301)
- **Email:** mohammedmego15@gmail.com


