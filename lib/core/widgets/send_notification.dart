import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void sendNotification({
  required String to,
  required String title,
  required String body,
  Map<String, dynamic>? data,
}) async {
  final message = {
    'to': to,
    'notification': {
      'title': title,
      'body': body,
      "sound": "default",
      "priority": "high",
      "category": "subscribe",
    },
    if (data != null) 'data': data,
  };

  await http.post(
    Uri.parse('https://fcm.googleapis.com/fcm/send'),
    body: jsonEncode(message),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':
          'key=AAAAZEzjhyA:APA91bFr-UEMt2TTp5wYbj5gKzYI3_QHBAJ05OE7viUSAlfgffy1fEn8_nrFKAL4iB8fKAtBnyMafitYDD0WS0X2_a5XvC3EWZUlfKbAUdFf9brUcYkw1lS2AKupIlKiPEj4knoYtZZC',
    },
  ).then((value) {
    if (kDebugMode) print(value.body.toString());
  }).onError((error, stackTrace) {
    if (kDebugMode) print(error);
  });
}
