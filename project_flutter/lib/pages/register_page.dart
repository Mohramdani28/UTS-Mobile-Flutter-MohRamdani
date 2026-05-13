import 'package:flutter/material.dart';

import '../services/local_storage_service.dart';
import '../utils/app_colors.dart';
import '../utils/validators.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  void register() async {

    if (formKey.currentState!.validate()) {

      await LocalStorageService.saveUser(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Register Success'),
        ),
      );

      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.dark,

      body: SafeArea(
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.all(24),

            child: Form(
              key: formKey,

              child: Column(
                children: [

                  const SizedBox(height: 40),

                  const Text(
                    'CREATE ACCOUNT',

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // NAME
                  CustomTextField(
                    hint: 'Full Name',
                    icon: Icons.person,
                    controller: nameController,
                    validator: Validators.name,
                  ),

                  const SizedBox(height: 20),

                  // EMAIL
                  CustomTextField(
                    hint: 'Email',
                    icon: Icons.email,
                    controller: emailController,
                    validator: Validators.email,
                  ),

                  const SizedBox(height: 20),

                  // PHONE
                  CustomTextField(
                    hint: 'Phone Number',
                    icon: Icons.phone,
                    controller: phoneController,
                    validator: Validators.phone,
                  ),

                  const SizedBox(height: 20),

                  // PASSWORD
                  CustomTextField(
                    hint: 'Password',
                    icon: Icons.lock,
                    obscureText: true,
                    controller: passwordController,
                    validator: Validators.password,
                  ),

                  const SizedBox(height: 30),

                  CustomButton(
                    text: 'REGISTER',
                    onPressed: register,
                  ),

                  const SizedBox(height: 20),

                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    child: const Text(
                      'Already have an account? Login',

                      style: TextStyle(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}