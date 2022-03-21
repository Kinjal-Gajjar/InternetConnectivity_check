import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
//using function check connection socket method
// void checkconne() async {
//   try {
//     final result = await InternetAddress.lookup('google.com');
//     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//       print('connected');
//     }
//   } on SocketException catch (_) {
//     print('no connection');
//   }
// }
//connectivity using
// void checkconne() async {
//   var connecresult = await (Connectivity().checkConnectivity());
//   if (connecresult == ConnectivityResult.none) {
//     print('no connection');
//   } else if (connecresult == ConnectivityResult.wifi) {
//     print('wifi');
//   } else if (connecresult == ConnectivityResult.mobile) {
//     print('mobile');
//   }
// }

class _MyHomePageState extends State<MyHomePage> {
  // ignore: cancel_subscriptions
  late StreamSubscription connectivitysubscription;
  late ConnectivityResult oldres;

  @override
  void initState() {
    super.initState();

    connectivitysubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult resnow) {
      if (resnow == ConnectivityResult.none) {
        print('not connected');
      } else if (oldres == ConnectivityResult.none) {
        if (resnow == ConnectivityResult.mobile)
          print('mobile connection available');
        else if (resnow == ConnectivityResult.wifi) print('wifi connection');
      }
      oldres = resnow;
    });
  }

  @override
  void dispose() {
    super.dispose();

    connectivitysubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Status',
              style: TextStyle(fontSize: 30.0, fontFamily: 'Time New Roman'),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'check !',
                  style: TextStyle(fontSize: 20.0),
                ))
          ],
        ),
      ),
    );
  }
}
