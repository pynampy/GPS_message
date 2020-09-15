import 'package:sms_maintained/sms.dart';
import 'package:location/location.dart';

List<String> allowedNumbers = ['+919811017961','+919811017961'];



void recieveMessages() async {
  SmsReceiver receiver = new SmsReceiver();
  receiver.onSmsReceived.listen((SmsMessage msg) {
  print(msg.body);
  print(msg.address);


  if(msg.body.startsWith('gps') && allowedNumbers.contains(msg.address)){
    getLocation(msg.address);
  }});
}

void getLocation(String address) async {
  Location location = new Location();
  String locData;
  location.getLocation().then((value)  {
    locData = 'gps:${value.longitude}'+':'+"${value.latitude}";
    sendMessage(locData,address);
  });

  
}

void sendMessage(String location, String address) async {
  SmsSender sender = new SmsSender();
  sender.sendSms(new SmsMessage(address, location));
}