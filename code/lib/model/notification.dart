import 'package:flutter/material.dart';
import 'package:push_noti/model/nortification_badge.dart';
import 'package:push_noti/model/pushnotification_model.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage(
      {required this.totalNotificationCounter, required this.notificationInfo});
  final int totalNotificationCounter;
  final PushNotification? notificationInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Push Notification')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'FlutterPushNotification',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          // showing a notification badge which will
          // count the total notification that we receive
          NotificationBadege(totalNotification: totalNotificationCounter),

          //if NotificationInfo is not null
          notificationInfo != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'TITLE: ${notificationInfo!.dataTitle ?? notificationInfo!.title}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      'BODY : ${notificationInfo!.dateBody ?? notificationInfo!.body}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                )
              : Container()
        ],
      )),
    );
  }
}
