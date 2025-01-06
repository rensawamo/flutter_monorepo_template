import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';

class InAppMessagingService {
  Future<void> trigger(String event) {
    return FirebaseInAppMessaging.instance.triggerEvent(event);
  }

  Future<void> disable({required bool value}) {
    return FirebaseInAppMessaging.instance.setMessagesSuppressed(value);
  }
}
