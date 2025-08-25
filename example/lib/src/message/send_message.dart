import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// LINEにメッセージを送信する関数
Future<void> sendLineMessage(String userId) async {
  // 先ほど取得したチャネルアクセストークンを利用
  const String channelAccessToken = 'zecEDNR5aI2D4h3nFGbCPyNWvJZkOdlaioxhOVb6SO5H/55aVeYnP4H2crg9wwnwnzHEj+5n0zQILBXCHIdDMi503x6j4t58AaBvRa8u+tdz5USZJvFI/z1W6uXvtecTsgsji+cbzvS4o56V/I1GeAdB04t89/1O/w1cDnyilFU=';
  const String apiUrl = 'https://api.line.me/v2/bot/message/push';

  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $channelAccessToken',
  };

  var body = jsonEncode({
    'to': userId,
    'messages': [
      {
        'type': 'text',
        'text': 'どーもサンプルです',
      },
    ],
  });

  try {
    var response = await http.post(Uri.parse(apiUrl), headers: headers, body: body);

    if (response.statusCode == 200) {
      print('Message sent successfully');
    } else {
      print('Failed to send message: ${response.statusCode}');
    }
  } catch (e) {
    print('Error occurred while sending message: $e');
  }
}
