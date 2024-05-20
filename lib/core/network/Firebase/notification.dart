

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../main.dart';
import '../Local/CashHelper.dart';



Future<void> handleBackGroundMessage(RemoteMessage message)async{
  print(message.notification?.title);
  print(message.notification?.body);
  print(message.data);
}

class FirebaseNotification{

  final _firebaseMessaging = FirebaseMessaging.instance;


  Future<void> handleMessage(RemoteMessage? message)async{
    if(message == null) return;

    navigationKey.currentState?.pushNamed(
      '/notification',

    );

  }

  Future<void> initPushNotification()async{

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    
    FirebaseMessaging.onBackgroundMessage(handleBackGroundMessage);



  }

  Future<void> init()async{

    await _requestPermission();
    
    final fCMToken = await _firebaseMessaging.getToken();

    CashHelper.prefs.setString('tokenNotification', fCMToken??'');

    print('Token Device Message : ${fCMToken}');
    
    initPushNotification();
    
    



  }


  
  
  Future<void> _requestPermission()async{
    await Permission.notification.isDenied.then((value) {
      if (value) {
        Permission.notification.request();
      }
    });
  }






}