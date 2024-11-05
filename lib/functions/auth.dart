// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:digital_app/config.dart';
import 'package:digital_app/screens/main/home.dart';
import 'package:digital_app/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// Register User
Future<void> registerUser(String username, String email, String password, context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  final response = await http.post(
    Uri.parse(AppVar().apiUrlRegister),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'username': username,
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 201) {
    Navigator.pop(context);
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('User registered successfully'),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Failed to register user'),
      ),
    );
  }
}

// Login User
Future<void> loginUser(String usernameOrEmail, String password, context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
  final response = await http.post(
    Uri.parse(AppVar().apiUrlLogin),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'username': usernameOrEmail,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    Navigator.pop(context);
    // Login successful, retrieve the access token
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    String accessToken = responseData['access_token'];
    // Save the access token
    saveToken(accessToken);

    // Navigate to the home screen
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (context) => const Home())
    );
  } else {
    Navigator.pop(context);
    // Login failed
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Failed to login user'),
      ),
    );
  }
}

// logout user
Future<void> logoutUser(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('access_token');

  if (token == null) {
    return;
  }

  final response = await http.delete(
    Uri.parse(AppVar().apiUrlLogout),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    await prefs.remove('access_token');
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const Login())
    );
  } else {
    // Handle error
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Failed to logout user'),
      ),
    );
  }
}

// Get user logged in status
Future<bool> isUserLoggedIn() async {
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('access_token');

  if (token == null) {
    return false;
  }
  return true;
}

// save Token
Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('access_token', token);
}