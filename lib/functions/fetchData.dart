import 'dart:convert';
import 'package:digital_app/config.dart';
import 'package:digital_app/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; 
import 'dart:async';

// Fetch user data
Future<Map<String, dynamic>?> fetchUserData(context) async {
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('access_token');

  if (token == null) {
    // Handle the case when there is no token
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    return null; // Return null or handle as necessary
  }

  final response = await http.get(
    Uri.parse(AppVar().apiUrlUser),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> userData = jsonDecode(response.body);
    return userData;
  } else {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const Login())
    );
    return null;
  }
}

// fetch requests
Future<List<dynamic>?> fetchRequest(String userId) async {
  try {
    final response = await http.get(
      Uri.parse("http://djalalservices.pythonanywhere.com/api/get_requests/$userId"),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    } else {
      fetchRequest(userId);
      return null;
    }
  } catch (e) {
    return null;
  }
}

// fetch messages
Stream<List<dynamic>?> fetchMessages(String requestId) async* {
  while (true) {
    try {
      final response = await http.get(
        Uri.parse("http://djalalservices.pythonanywhere.com/api/get_messages/$requestId"),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Decode response and yield it
        yield jsonDecode(response.body) as List<dynamic>;
      } else {
        yield null; // Optionally handle errors here
      }
    } catch (e) {
      yield null; // Handle exceptions
    }

    await Future.delayed(Duration(seconds: 5)); // Delay between requests
  }
}