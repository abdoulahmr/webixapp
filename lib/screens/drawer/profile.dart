import 'package:digital_app/config.dart';
import 'package:digital_app/functions/fetchData.dart';
import 'package:digital_app/screens/drawer/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? userData;
  List<dynamic>? userMessages;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData(context).then((value) {
      if (value != null) {
        setState(() {
          userData = value;
          isLoading = true;
        });
        fetchRequest(userData!['id'].toString()).then((messages) {
          setState(() {
            userMessages = messages;
            isLoading = false;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors().secondaryColor,
        leading: Skeletonizer(
          enabled: isLoading,
          child: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
        actions: [
          Skeletonizer(
            enabled: isLoading,
            child: Builder(
              builder: (context) {
                return Row(
                  children: [
                    const Text("Edit"),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditProfileScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      body: Skeletonizer(
        enabled: isLoading,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  color: AppColors().secondaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(60.0),
                    bottomRight: Radius.circular(60.0),
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: AppColors().primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: const BoxDecoration(
                          color: Colors.white70,
                          borderRadius:BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              userMessages != null
                              ? userMessages!.length.toString()
                              : 'loading...',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors().primaryColor,
                                fontWeight: FontWeight.bold,
                              )
                            ),
                            const SizedBox(width: 10),
                            Icon(
                              Icons.message,
                              color: AppColors().primaryColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    children: [
                    const SizedBox(height: 40),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Username:'),
                          Text(
                            userData != null ? userData!['username'] : '',
                            style: TextStyle(color: AppColors().primaryColor,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Email:'),
                          Text(
                            userData != null ? userData!['email'] : '',
                            style: TextStyle(color: AppColors().primaryColor,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('First Name:'),
                          Text(
                            userData != null && userData!['first_name'] != null
                            ? userData!['first_name'] 
                            : '',
                            style: TextStyle(color: AppColors().primaryColor,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Last Name:'),
                          Text(
                            userData != null && userData!['last_name'] != null
                            ? userData!['last_name'] 
                            : '',
                            style: TextStyle(color: AppColors().primaryColor,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Phone Number:'),
                          Text(
                            userData != null && userData!['phone_number'] != null
                            ? userData!['phone_number'] 
                            : '',
                            style: TextStyle(color: AppColors().primaryColor,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('CCP:'),
                          Text(
                            userData != null && userData!['ccp'] != null
                            ? userData!['ccp'] 
                            : '',
                            style: TextStyle(color: AppColors().primaryColor,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
