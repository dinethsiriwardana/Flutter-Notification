import 'package:flutter/material.dart';
import 'package:push_noti/model/check_new_noti.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Push Notification')),
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 50.0,
          ),
          const Text(
            'Flutter Push Notification',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          const SizedBox(
            height: 200,
          ),
          ElevatedButton(
              onPressed: () {
                //Refresh the page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckNewNoti()),
                );
              },
              child: const Text('Refresh'))
        ],
      )),
    );
  }
}
