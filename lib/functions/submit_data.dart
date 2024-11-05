import 'package:digital_app/screens/main/home.dart';
import 'package:flutter/material.dart';
import 'package:digital_app/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> submitFormRequest(
  int type,
  String pageName,
  String pageUrl,
  String selectedObjective,
  String targetAudience, 
  String budget, 
  String duration,
  int userID, 
  context
  ) async {

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
  final response = await http.post(
    Uri.parse(AppVar().apiUrlSubReq+type.toString()),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'page_name': pageName,
      'page_url': pageUrl,
      'campaign_objective': selectedObjective,
      'target_audience': targetAudience,
      'budget': budget,
      'duration': duration,
      'user_id': userID.toString(),
    }),
  );
  
  Navigator.pop(context);

  if (response.statusCode == 200) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Your request has been submitted successfully'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  } else {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Failed to submit request ${response.statusCode}'),
      ),
    );
  }
}

// send message
Future<void> sendMessage(
  String message,
  int userID,
  int requestID,
  context
  ) async {
  final response = await http.post(
    Uri.parse("${AppVar().apiUrlSendMessage}/$userID"),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'message': message,
      'request_id': requestID.toString(),
    }),
  );
  
  Navigator.pop(context);

  if (response.statusCode == 200) {
    // do something
  } else {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Failed to send message ${response.statusCode}'),
      ),
    );
  }
}