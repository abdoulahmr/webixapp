import 'package:digital_app/config.dart';
import 'package:digital_app/screens/auth/login.dart';
import 'package:digital_app/screens/auth/register.dart';
import 'package:flutter/material.dart';

class PreAuth extends StatelessWidget {
  const PreAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 250),
                const Image(
                  image: AssetImage('assets/logo2.png'),
                  width: 300,
                ),
                const SizedBox(height: 150),
                ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size(
                        MediaQuery.of(context).size.width*0.85, 
                        MediaQuery.of(context).size.height*0.06
                      ),
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
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const Login())
                    );
                  }, 
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size(
                        MediaQuery.of(context).size.width*0.85, 
                        MediaQuery.of(context).size.height*0.06
                      ),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: AppColors().primaryColor),
                      ),
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const Register())
                    );
                  }, 
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors().primaryColor,
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}