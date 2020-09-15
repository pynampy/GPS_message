import 'package:flutter/material.dart';
import 'package:sample_gps/message_proccess.dart';
import 'package:sms_maintained/sms.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
   SmsReceiver receiver = new SmsReceiver();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Center(
          child: RaisedButton(
            child: Text(
              "Start"
            ),
            onPressed: (){
              recieveMessages();
            })
        ),
        StreamBuilder(
          stream: receiver.onSmsReceived ,
          builder: (context,snapshot){
            if(snapshot.hasData){
              return Text(snapshot.data.body);
            }
            return Text("Awaiting message .. !");
          })
              ] 
      ),
    );
  }
}
