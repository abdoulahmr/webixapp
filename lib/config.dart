import 'package:flutter/material.dart';

class AppColors{
  Color primaryColor = const Color(0xFF3D0076);
  Color secondaryColor = const Color(0xFF8ED5FF);
  Color tertiaryColor = const Color(0xFFE5E5E5);
}

class AppVar{
  final String apiUrlRegister = 'http://djalalservices.pythonanywhere.com/api/register';
  final String apiUrlLogin = 'http://djalalservices.pythonanywhere.com/api/login';
  final String apiUrlUser = 'http://djalalservices.pythonanywhere.com/api/user';
  final String apiUrlLogout = 'http://djalalservices.pythonanywhere.com/api/logout';
  final String apiUrlSubReq = 'http://djalalservices.pythonanywhere.com/api/submit_sponsor_request/';
  final String apiUrlReq = 'http://djalalservices.pythonanywhere.com/api/get_requests/';
  final String apiUrlSendMessage = 'http://djalalservices.pythonanywhere.com/api/send_message/';
}