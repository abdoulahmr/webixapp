import 'package:digital_app/config.dart';
import 'package:digital_app/functions/fetchData.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  Map<String, dynamic>? userData;
  bool isLoading = true;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _ccpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserData(context).then((value) {
      if (value != null) {
        setState(() {
          userData = value;
          _usernameController.text = userData!['username'];
          _emailController.text = userData!['email'];
          _firstNameController.text = userData!['first_name'] ?? '';
          _lastNameController.text = userData!['last_name'] ?? '';
          _phoneNumberController.text = userData!['phone_number'] ?? '';
          _ccpController.text = userData!['ccp'] ?? '';
          isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _ccpController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    
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
        title: const Text('Edit Profile'),
        centerTitle: true,
        actions: [
          Skeletonizer(
            enabled: isLoading,
            child: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.save),
                  onPressed: _saveProfile,
                );
              },
            ),
          ),
        ],
      ),
      body: Skeletonizer(
        enabled: isLoading,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                _buildTextField('Username', _usernameController),
                const SizedBox(height: 20),
                _buildTextField('Email', _emailController),
                const SizedBox(height: 20),
                _buildTextField('First Name', _firstNameController),
                const SizedBox(height: 20),
                _buildTextField('Last Name', _lastNameController),
                const SizedBox(height: 20),
                _buildTextField('Phone Number', _phoneNumberController),
                const SizedBox(height: 20),
                _buildTextField('CCP', _ccpController),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}