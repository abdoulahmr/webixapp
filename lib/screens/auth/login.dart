import 'package:digital_app/config.dart';
import 'package:digital_app/functions/auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Create controllers as class members
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Image(
                image: AssetImage('assets/logo1.png'),
                width: 150,
              ),
              const SizedBox(height: 10),
              Text(
                "Welcome back! Glad to see you, Again!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors().primaryColor,
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email or Username',
                  hintText: 'ex: email@example.org',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: AppColors().primaryColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                  hintText: '********',
                  labelText: 'Password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: AppColors().primaryColor),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width * 0.85, MediaQuery.of(context).size.height * 0.06),
                  ),
                  backgroundColor: MaterialStateProperty.all(AppColors().primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: AppColors().primaryColor),
                    ),
                  ),
                ),
                onPressed: () {
                  loginUser(email.text, password.text, context);
                }, 
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Divider(
                color: AppColors().primaryColor,
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: AppColors().primaryColor,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
