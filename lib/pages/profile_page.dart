import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/local_storage_service.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  String imagePath = '';
  Uint8List? webImage;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  // LOAD USER
  void loadUser() async {

    final user = await LocalStorageService.getUser();

    setState(() {

      nameController.text = user['name'] ?? '';
      emailController.text = user['email'] ?? '';
      phoneController.text = user['phone'] ?? '';
      imagePath = user['image'] ?? '';

      // WEB IMAGE
      if (kIsWeb && imagePath.isNotEmpty) {
        webImage = base64Decode(imagePath);
      }
    });
  }

  // PICK IMAGE
  Future pickImage() async {

    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {

      // WEB
      if (kIsWeb) {

        final bytes = await pickedFile.readAsBytes();

        setState(() {
          webImage = bytes;
          imagePath = base64Encode(bytes);
        });

      } else {

        // MOBILE
        setState(() {
          imagePath = pickedFile.path;
        });
      }
    }
  }

  // SAVE PROFILE
  void saveProfile() async {

    final user = await LocalStorageService.getUser();

    await LocalStorageService.saveUser(
      name: nameController.text,
      email: emailController.text,
      password: user['password'] ?? '',
      phone: phoneController.text,
      image: imagePath,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile Updated'),
      ),
    );
  }

  // LOGOUT
  void logout() async {

    await LocalStorageService.logout();

    Navigator.pushNamedAndRemoveUntil(
      context,
      '/',
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.dark,

      appBar: AppBar(
        backgroundColor: AppColors.dark,
        elevation: 0,

        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          children: [

            const SizedBox(height: 20),

            // PROFILE IMAGE
            Stack(
              children: [

                CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.white12,

                  backgroundImage:
                      imagePath.isNotEmpty
                          ? (kIsWeb
                              ? MemoryImage(webImage!)
                              : FileImage(File(imagePath))
                                  as ImageProvider)
                          : null,

                  child: imagePath.isEmpty
                      ? const Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.white,
                        )
                      : null,
                ),

                Positioned(
                  bottom: 0,
                  right: 0,

                  child: GestureDetector(
                    onTap: pickImage,

                    child: Container(
                      padding: const EdgeInsets.all(10),

                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // NAME
            TextField(
              controller: nameController,

              style: const TextStyle(
                color: Colors.white,
              ),

              decoration: InputDecoration(
                labelText: 'Name',

                labelStyle: const TextStyle(
                  color: Colors.grey,
                ),

                filled: true,
                fillColor: Colors.white10,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // EMAIL
            TextField(
              controller: emailController,

              style: const TextStyle(
                color: Colors.white,
              ),

              decoration: InputDecoration(
                labelText: 'Email',

                labelStyle: const TextStyle(
                  color: Colors.grey,
                ),

                filled: true,
                fillColor: Colors.white10,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // PHONE
            TextField(
              controller: phoneController,

              style: const TextStyle(
                color: Colors.white,
              ),

              decoration: InputDecoration(
                labelText: 'Phone Number',

                labelStyle: const TextStyle(
                  color: Colors.grey,
                ),

                filled: true,
                fillColor: Colors.white10,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // SAVE BUTTON
            CustomButton(
              text: 'SAVE CHANGES',
              onPressed: saveProfile,
            ),

            const SizedBox(height: 20),

            // LOGOUT BUTTON
            CustomButton(
              text: 'LOGOUT',
              onPressed: logout,
            ),
          ],
        ),
      ),
    );
  }
}