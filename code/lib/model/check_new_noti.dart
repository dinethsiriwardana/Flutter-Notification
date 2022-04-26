import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:push_noti/home.dart';
import 'package:push_noti/model/nortification_badge.dart';
import 'package:push_noti/model/notification.dart';
import 'package:push_noti/model/pushnotification_model.dart';

class CheckNewNoti extends StatefulWidget {
  const CheckNewNoti({Key? key}) : super(key: key);

  @override
  State<CheckNewNoti> createState() => _CheckNewNotiState();
}

class _CheckNewNotiState extends State<CheckNewNoti> {
  // initialize some values
  late final FirebaseMessaging _messaging;
  late int _totalNotificationCounter;
  //model
  PushNotification? _notificationInfo;

  // register notification
  void registerNotification() async {
    await Firebase.initializeApp();
    //instance for firebase messaging
    _messaging = FirebaseMessaging.instance;

    // three type of state in notification
    // not determined (null) , granted (true) and decline (false)

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // print('User granted the permissioin');

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        PushNotification notification = PushNotification(
          title: message.notification!.title,
          body: message.notification!.body,
          dataTitle: message.data['title'],
          dateBody: message.data['body'],
        );

        setState(() {
          _totalNotificationCounter++;
          _notificationInfo = notification;
        });

        if (notification != null) {
          showSimpleNotification(Text(_notificationInfo!.title!),
              leading: NotificationBadege(
                  totalNotification: _totalNotificationCounter),
              subtitle: Text(_notificationInfo!.body!),
              background: Colors.cyan.shade700,
              // foreground: Colors.red,
              duration: Duration(seconds: 30));
        }
      });
    } else {
      AlertDialog(
        title: const Text('Premission declined'),
        content: const Text('Premission declined by User'),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {},
          ),
        ],
      );
    }
  }

  //check the initial message that we receive
  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      PushNotification notification = PushNotification(
        title: initialMessage.notification!.title,
        body: initialMessage.notification!.body,
        dataTitle: initialMessage.data['title'],
        dateBody: initialMessage.data['body'],
      );
      setState(() {
        _totalNotificationCounter++;
        _notificationInfo = notification;
      });
    }
  }

  apponBackground() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification!.title,
        body: message.notification!.body,
        dataTitle: message.data['title'],
        dateBody: message.data['body'],
      );
      setState(() {
        _totalNotificationCounter++;
        _notificationInfo = notification;
      });
    });
  }

  @override
  void initState() {
    try {
      //when app is in background
      apponBackground();
    } catch (e) {
      print('apponBackground:- ${e.toString()}');
    }
    try {
      //when app is in background
      registerNotification();
    } catch (e) {
      print('apponBackground:- ${e.toString()}');
    }
    try {
      // when appi is in terminated state
      checkForInitialMessage();
    } catch (e) {
      print('apponBackground:- ${e.toString()}');
    }
    _totalNotificationCounter = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('notificationInfo: ${_notificationInfo}');
    // print(_totalNotificationCounter);
    if (_notificationInfo == null) {
      return const Home();
    } else {
      // print(_notificationInfo);
      return NotificationPage(
        notificationInfo: _notificationInfo,
        totalNotificationCounter: _totalNotificationCounter,
      );
    }
  }
}
