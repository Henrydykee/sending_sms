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

  var numberController =TextEditingController();
  var messageController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Sms"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: numberController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: "Enter the mobile number"
            ),
          ),
          SizedBox(height: 5,),
          TextField(
            controller: messageController,
            decoration: InputDecoration(
                labelText: "Enter the message"
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: FlatButton(
                color: Colors.blue,
                onPressed: (){
                  SmsSender sender = SmsSender();
                  String address = numberController.text.trim();
                  SmsMessage message = SmsMessage(address, messageController.text.trim());
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


