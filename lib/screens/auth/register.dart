import 'package:digital_app/config.dart';
import 'package:digital_app/functions/auth.dart';
import 'package:digital_app/screens/auth/login.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController username = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController rePassword = TextEditingController();

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
              const Image(
                image: AssetImage('assets/logo1.png'),
                width: 100,
              ),
              const SizedBox(height: 10),
              Text(
                "Create an account to get started",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors().primaryColor,
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: username,
                decoration: InputDecoration(
                  labelText: 'username',
                  hintText: 'user123',
                  labelStyle: TextStyle(
                    color: AppColors().primaryColor
                  ),
                  border: OutlineInputBorder( borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: AppColors().primaryColor)
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  labelText: 'email',
                  hintText: 'ex :email@exemple.com',
                  labelStyle: TextStyle(
                    color: AppColors().primaryColor
                  ),
                  border: OutlineInputBorder( borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: AppColors().primaryColor)
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                  hintText: '********',
                  labelText: 'password',
                  labelStyle: TextStyle(
                    color: AppColors().primaryColor
                  ),
                  border: OutlineInputBorder( borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: AppColors().primaryColor)
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: rePassword,
                decoration: InputDecoration(
                  hintText: '********',
                  labelText: 'confirm password',
                  labelStyle: TextStyle(
                    color: AppColors().primaryColor
                  ),
                  border: OutlineInputBorder( borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: AppColors().primaryColor)
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width*0.85, MediaQuery.of(context).size.height*0.06),
                  ),
                  backgroundColor: MaterialStateProperty.all(AppColors().primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: AppColors().primaryColor),
                    ),
                  ),
                ),
                onPressed: (){
                  if(password.text == rePassword.text){
                    registerUser(username.text ,email.text, password.text, context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Passwords do not match'),
                      ),
                    );
                  }
                }, 
                child: const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                )
              ),
              const SizedBox(height: 10),
                Divider(
                  color: AppColors().primaryColor,
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const Login())
                    );
                  },
                  child: Text(
                    "Alrady have an account?",
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