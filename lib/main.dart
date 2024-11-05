import 'package:digital_app/functions/auth.dart';
import 'package:digital_app/screens/main/home.dart';
import 'package:digital_app/screens/auth/pre_auth.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool isLogged = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    bool loggedIn = await isUserLoggedIn();
    setState(() {
      isLogged = loggedIn;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoading 
          ? const Center(child: CircularProgressIndicator())
          : (isLogged ? const Home() : const PreAuth()),
    );
  }
}
