import 'package:digital_app/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GraphicDesignRequest extends StatefulWidget {
  final int userID;
  const GraphicDesignRequest({super.key, required this.userID});

  @override
  State<GraphicDesignRequest> createState() => _GraphicDesignRequestState();
}

class _GraphicDesignRequestState extends State<GraphicDesignRequest> {
  List<String> designType = <String>[
    'Logo Design',
    'Flyer Design',
    'Social Media Graphics',
    'Business Cards',
    'Other'
  ];

  String? selectedDesignType;

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
          'Graphic Design Service',
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
                      'Please fill in the details below to request a Graphic Design Service',
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.design_services,
                    size: 50,
                    color: AppColors().primaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Project Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.blueAccent),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: selectedDesignType,
                decoration: InputDecoration(
                  labelText: 'Select Design Type',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
                items: designType.map((String design) {
                  return DropdownMenuItem<String>(
                    value: design,
                    child: Text(design),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDesignType = newValue;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description of Project',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.blueAccent),
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
                    borderSide: const BorderSide(color: Colors.blueAccent),
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
                  const Text('Include revisions'),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Payment Instructions: Make sure to send the payment to our account before the project starts.',
                style: TextStyle(
                  fontSize: 15, 
                  color: AppColors().primaryColor
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Account: 9876543210',
                    style: TextStyle(
                      fontSize: 15, 
                      color: AppColors().primaryColor
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      Clipboard.setData(
                          const ClipboardData(text: '9876543210')).then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Copied to clipboard')),
                        );
                      });
                    },
                    icon: const Icon(Icons.copy),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width * 0.85,
                        MediaQuery.of(context).size.height * 0.06),
                  ),
                  backgroundColor:MaterialStateProperty.all(AppColors().primaryColor),
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
