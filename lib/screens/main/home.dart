import 'package:digital_app/config.dart';
import 'package:digital_app/functions/auth.dart';
import 'package:digital_app/functions/fetchData.dart';
import 'package:digital_app/screens/drawer/abdout_us.dart';
import 'package:digital_app/screens/drawer/contact_us.dart';
import 'package:digital_app/screens/drawer/profile.dart';
import 'package:digital_app/screens/requests/appdev_request.dart';
import 'package:digital_app/screens/requests/facebook_request.dart';
import 'package:digital_app/screens/main/messages.dart';
import 'package:digital_app/screens/requests/graphicdes_request.dart';
import 'package:digital_app/screens/requests/instagram_request.dart';
import 'package:digital_app/screens/requests/snapchat_request.dart';
import 'package:digital_app/screens/requests/tiktok_request.dart';
import 'package:digital_app/screens/requests/webdev_requst.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic>? userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData(context).then((value) {
      setState(() {
        userData = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          "Wibix Services",
            style: TextStyle(color: AppColors().primaryColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors().secondaryColor,
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
            const DrawerHeader(
              child: Image(
                image: AssetImage('assets/logo2.png'),
                width: 300,
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              leading: const Icon(Icons.person),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen(),)
                );
              },
            ),
            ListTile(
              title: const Text('About Us'),
              leading: const Icon(Icons.info),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutUsScreen())
                );
              },
            ),
            ListTile(
              title: const Text('Contact Us'),
              leading: const Icon(Icons.contact_mail),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactUsScreen())
                );
              },
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                      Text(
                        "hello, ${userData?['username']}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: const BoxDecoration(
                          color: Colors.white70,
                          borderRadius:BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "1234",
                              style: TextStyle(
                                color: AppColors().primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text("servies done"),
                            const SizedBox(width: 10),
                            const Icon(Icons.done),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3)),
                    ],
                  ),
                  child: ListTile(
                    title: const Text("Social Marketing Service"),
                    subtitle: const Text("Facebook, Instagram, Snapchat, TikTok"),
                    leading: Icon(Icons.people, color: AppColors().primaryColor),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors().primaryColor
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              height: MediaQuery.of(context).size.height * 0.43,
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                        Size(
                                          MediaQuery.of(context).size.width *0.85,
                                          MediaQuery.of(context).size.height *0.06
                                        ),
                                      ),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                          side: BorderSide(color:AppColors().primaryColor),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute( builder: (context) =>FacebookRequest(userID: userData?['id'],))
                                      );
                                    },
                                    child: const Row(
                                      children: [
                                        Icon(Icons.facebook),
                                        SizedBox(width: 10),
                                        Text("Facebook"),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                        Size(
                                          MediaQuery.of(context).size.width *0.85,
                                          MediaQuery.of(context).size.height *0.06
                                        ),
                                      ),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                          side: BorderSide(color:AppColors().primaryColor),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => InstagramRequest(userID:userData?['id']))
                                      );
                                    },
                                    child: const Row(
                                      children: [
                                        Icon(FontAwesomeIcons.instagram),
                                        SizedBox(width: 10),
                                        Text("Instagram"),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                        Size(
                                          MediaQuery.of(context).size.width *0.85,
                                          MediaQuery.of(context).size.height *0.06
                                        ),
                                      ),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                          side: BorderSide(color:AppColors().primaryColor),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => SnapchatRequest( userID:userData?['id']))
                                      );
                                    },
                                    child: const Row(
                                      children: [
                                        Icon(Icons.snapchat),
                                        SizedBox(width: 10),
                                        Text("Snapchat"),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                        Size(
                                          MediaQuery.of(context).size.width *0.85,
                                          MediaQuery.of(context).size.height *0.06
                                        ),
                                      ),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                          side: BorderSide(color:AppColors().primaryColor),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>TikTokRequest(userID:userData?['id']))
                                      );
                                    },
                                    child: const Row(
                                      children: [
                                        Icon(Icons.tiktok),
                                        SizedBox(width: 10),
                                        Text("TikTok"),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                        Size(
                                          MediaQuery.of(context).size.width *0.85,
                                          MediaQuery.of(context).size.height *0.06
                                        ),
                                      ),
                                      backgroundColor:MaterialStateProperty.all(AppColors().primaryColor),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(borderRadius:BorderRadius.circular(15.0),),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3)
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: const Text("Currency Exchange Service"),
                    subtitle: const Text("USD, EUR, DZD, USDT"),
                    leading: Icon(
                      Icons.swap_horiz,
                      color: AppColors().primaryColor
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors().primaryColor
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3)
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: const Text("Visa Card Service"),
                    subtitle: const Text("RedotPay, PYPL, WISE"),
                    leading:  Icon(
                      Icons.payment, 
                      color: AppColors().primaryColor
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors().primaryColor
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3)
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: const Text("Web Development Service"),
                    subtitle: const Text("Web apps, websites"),
                    leading: Icon(
                      Icons.developer_mode,
                      color: AppColors().primaryColor
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors().primaryColor
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute( builder: (context) => WebDevRequest(userID: userData?['id'],))
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3)
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: const Text("Mobile Development Service"),
                    subtitle: const Text("Android, iOS"),
                    leading: Icon(
                      Icons.phone_android,
                      color: AppColors().primaryColor
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors().primaryColor
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MobileAppRequest(userID: userData?['id'],))
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3)
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: const Text("Graphic Design Service"),
                    subtitle: const Text("Logo, Banner"),
                    leading: Icon(
                      Icons.design_services,
                      color: AppColors().primaryColor
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors().primaryColor
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GraphicDesignRequest(userID: userData?['id'],))
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3)
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: const Text("Digital Marketing Service"),
                    subtitle: const Text("SEO, SEM"),
                    leading: Icon(
                      Icons.mark_email_read,
                      color: AppColors().primaryColor
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors().primaryColor
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3)
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: const Text("E-commerce Service"),
                    subtitle: const Text("Shopify, WooCommerce"),
                    leading: Icon(
                      Icons.shopping_cart,
                      color: AppColors().primaryColor
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors().primaryColor
                    ),
                    onTap: () {},
                  ),
                ),
                
              ],
            ),
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
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  color: AppColors().primaryColor,
                  size: 30,
                )
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Messages())
                );
              },
              icon: const Icon(
                Icons.message,
                color: Colors.white,
                size: 30,
              )
            ),
          ],
        ),
      )
    );
  }
}
