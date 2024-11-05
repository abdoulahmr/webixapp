import "package:digital_app/config.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

class MobileAppRequest extends StatefulWidget {
  final int userID;
  const MobileAppRequest({super.key, required this.userID});

  @override
  State<MobileAppRequest> createState() => _MobileAppRequestState();
}

class _MobileAppRequestState extends State<MobileAppRequest> {
  List<String> appType = <String>[
    'E-commerce',
    'Social Media',
    'On-demand Service',
    'Other'
  ];

  String? selectedAppType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Mobile App Development',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: const Text(
                      'Please fill in the details below to request a Mobile App Development service',
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.phone_android,
                    size: 50,
                    color: AppColors().primaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'App Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: AppColors().primaryColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: selectedAppType,
                decoration: InputDecoration(
                  labelText: 'Select App Type',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
                items: appType.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedAppType = newValue;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Location (if any)',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: AppColors().primaryColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Business Description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: AppColors().primaryColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Goals for the App',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: AppColors().primaryColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Budget',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: AppColors().primaryColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  const Text('Design & Branding'),
                ],
              ),
              const Text(
                'Design & branding includes logo creation, app colors, and other visual elements.',
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Make sure to send money to our CCP account',
                style: TextStyle(fontSize: 15, color: AppColors().primaryColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'CCP Account: 1234567890',
                    style: TextStyle(
                        fontSize: 15, color: AppColors().primaryColor),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      Clipboard.setData(const ClipboardData(text: '1234567890'))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Copied to clipboard')),
                        );
                      });
                    },
                    icon: const Icon(Icons.copy),
                  )
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width * 0.85,
                        MediaQuery.of(context).size.height * 0.06),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(AppColors().primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: AppColors().primaryColor),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Submit Request",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
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
