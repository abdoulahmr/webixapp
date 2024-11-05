import "package:digital_app/config.dart";
import "package:digital_app/functions/auth.dart";
import "package:digital_app/functions/fetchData.dart";
import "package:digital_app/screens/main/home.dart";
import "package:digital_app/screens/main/message_view.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:skeletonizer/skeletonizer.dart";
import 'package:intl/intl.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
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
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
          ),
          centerTitle: true,
          title: Text(
            "Webix Services",
            style: TextStyle(
                color: AppColors().primaryColor, fontWeight: FontWeight.bold),
          ),
          actions: [
            Skeletonizer(
              enabled: isLoading,
              child: IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  logoutUser(context);
                },
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors().secondaryColor,
                ),
                child: const Text('Webix Services'),
              ),
              ListTile(
                title: const Text('Profile'),
                leading: const Icon(Icons.person),
                onTap: () {},
              ),
              ListTile(
                title: const Text('About Us'),
                leading: const Icon(Icons.info),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Contact Us'),
                leading: const Icon(Icons.contact_mail),
                onTap: () {},
              ),
              const Divider(
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                onTap: () {
                  logoutUser(context);
                },
              ),
            ],
          ),
        ),
        body: Skeletonizer(
          enabled: isLoading,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 70),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    color: AppColors().secondaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(60.0),
                      bottomRight: Radius.circular(60.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text("Service Requests",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: const BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
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
                                )),
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
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: userMessages?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Icon(
                          userMessages![index]['request_type'] == 1
                              ? Icons.facebook
                              : userMessages![index]['request_type'] == 2
                                  ? FontAwesomeIcons.instagram
                                  : userMessages![index]['request_type'] == 3
                                      ? FontAwesomeIcons.snapchat
                                      : userMessages![index]['request_type'] ==
                                              4
                                          ? FontAwesomeIcons.tiktok
                                          : Icons.help,
                          color: AppColors().primaryColor,
                          size: 30,
                        ),
                        title: Text(
                          userMessages![index]['request_type'] == 1
                              ? "Facebook Request"
                              : userMessages![index]['request_type'] == 2
                                  ? "Instagram Request"
                                  : userMessages![index]['request_type'] == 3
                                      ? "Snapchat Request"
                                      : userMessages![index]['request_type'] ==
                                              4
                                          ? "Tiktok Request"
                                          : "Unknown Request",
                        ),
                        subtitle: Text(
                          DateFormat('dd/MM/yyyy HH:mm').format(
                            DateFormat('EEE, dd MMM yyyy HH:mm:ss z')
                                .parse(userMessages![index]['created_at']),
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.arrow_forward_ios),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MessageView(
                                requestID: userMessages![index]['id'].toString(),
                                userID: userData!['id'].toString(),
                              ))
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          height: 70,
          decoration: BoxDecoration(
            color: AppColors().primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 30,
                  )),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.message,
                      color: AppColors().primaryColor,
                      size: 30,
                    )),
              ),
            ],
          ),
        ));
  }
}
