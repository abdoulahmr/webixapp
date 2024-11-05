import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Connect with us!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('contact@company.com'),
            ),
            ListTile(
              leading: Icon(Icons.facebook),
              title: Text('Facebook'),
              subtitle: Text('facebook.com/company'),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.twitter),
              title: Text('Twitter'),
              subtitle: Text('twitter.com/company'),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.instagram),
              title: Text('Instagram'),
              subtitle: Text('instagram.com/company'),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.whatsapp),
              title: Text('Whatsapp'),
              subtitle: Text('whatsapp.com/company'),
            ),
          ],
        ),
      ),
    );
  }
}
