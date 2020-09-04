import 'package:flutter/material.dart';
import 'package:sms_maintained/contact.dart';
import 'package:sms_maintained/generated/i18n.dart';
import 'package:sms_maintained/globals.dart';
import 'package:sms_maintained/sms.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Hompage(),
    );
  }
}

class Hompage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Hompage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Sms"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: FlatButton(
                color: Colors.black,
                onPressed: (){
                  SmsSender sender = SmsSender();
                  String address = "09056675390";
                  SmsMessage message = SmsMessage(address, 'Hello flutter!');
                  message.onStateChanged.listen((state) {
                    if (state == SmsMessageState.Sent) {
                      print("SMS is sent!");
                    } else if (state == SmsMessageState.Delivered) {
                      print("SMS is delivered!");
                    }
                  });
                  sender.sendSms(message);
                },
                child: Text("Send",style: TextStyle(
                    color: Colors.black
                ),)),
          ),
        ],
      ),
    );
  }
}


