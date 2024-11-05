import 'package:digital_app/config.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/logo3.png'),
                width: 200,
              ),
              const SizedBox(height: 30),
              const Divider(
                color: Colors.grey,
                thickness: 1,
                indent: 50,
                endIndent: 50,
              ),
              Text(
                "Our Team",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors().primaryColor
                ),
              ),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 100,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "John Doe",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "CEO",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 100,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Jane Doe",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "CTO",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Divider(
                color: Colors.grey,
                thickness: 1,
                indent: 50,
                endIndent: 50,
              ),
              Text(
                "About Our Company",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors().primaryColor
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "At Webix Services, we specialize in providing top-notch digital solutions to help businesses thrive in the digital age. With a dedicated team of designers, developers, and strategists, we are committed to transforming ideas into innovative solutions that drive success.",
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Colors.grey,
                thickness: 1,
                indent: 50,
                endIndent: 50,
              ),
              Text(
                "Our Mission",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors().primaryColor
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Our mission is to empower businesses of all sizes with creative digital solutions. We aim to deliver high-quality web and mobile applications, graphic design services, and marketing solutions to drive our clients' growth.",
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Colors.grey,
                thickness: 1,
                indent: 50,
                endIndent: 50,
              ),
              Text(
                "Our Values",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors().primaryColor
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "• Innovation: Constantly pushing the boundaries of what's possible.\n"
                "• Quality: Delivering exceptional results in every project.\n"
                "• Customer Focus: Tailoring our solutions to meet the unique needs of each client.",
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
