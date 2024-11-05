import "package:digital_app/config.dart";
import "package:digital_app/functions/submit_data.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class TikTokRequest extends StatefulWidget {
  final int userID;
  const TikTokRequest({super.key, required this.userID});

  @override
  State<TikTokRequest> createState() => _TikTokRequestState();
}

class _TikTokRequestState extends State<TikTokRequest> {
  List<String> objectives = <String>[
    'Engagement',
    'Messages',
    'Promote Page and Followers',
    'Views'
  ];

  String? selectedObjective;

  final TextEditingController pageNameController = TextEditingController();
  final TextEditingController pageUrlController = TextEditingController();
  final TextEditingController targetAudienceController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController durationController = TextEditingController();

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
          'Tiktok Marketing Service',
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
                      'Please fill in the details below to request a Facebook Marketing Service',
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(
                    FontAwesomeIcons.tiktok,
                    color: AppColors().primaryColor,
                    size: 50
                  ),
                ],
              ),
              Text(
                'We will get back to you within 24 hours',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors().primaryColor
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: pageNameController,
                decoration: InputDecoration(
                  labelText: 'Page Name',
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
                controller: pageUrlController,
                decoration: InputDecoration(
                  labelText: 'Page URL',
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
                value: selectedObjective,
                decoration: InputDecoration(
                  labelText: 'Campaign Objective',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
                items: objectives.map((String objective) {
                  return DropdownMenuItem<String>(
                    value: objective,
                    child: Text(objective),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedObjective = newValue;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: targetAudienceController,
                decoration: InputDecoration(
                  labelText: 'Target Audience',
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
                controller: budgetController,
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
              TextFormField(
                controller: durationController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Duration (in days)',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: AppColors().primaryColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text('make sure to send money to our ccp account',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors().primaryColor
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('CCP Account: 1234567890',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors().primaryColor
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      Clipboard.setData(const ClipboardData(text: '1234567890')).then((_) {
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
                    Size(MediaQuery.of(context).size.width * 0.85, MediaQuery.of(context).size.height * 0.06),
                  ),
                  backgroundColor: MaterialStateProperty.all(AppColors().primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: AppColors().primaryColor),
                    ),
                  ),
                ),
                onPressed: () {
                  submitFormRequest(
                    4,
                    pageNameController.text,
                    pageUrlController.text,
                    selectedObjective!,
                    targetAudienceController.text,
                    budgetController.text,
                    durationController.text,
                    widget.userID,
                    context,
                  );
                }, 
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