import 'package:flutter/material.dart';

import '../services/local_storage_service.dart';
import '../utils/app_colors.dart';
import '../utils/validators.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {

    if (formKey.currentState!.validate()) {

      final user = await LocalStorageService.getUser();

      if (emailController.text == user['email'] &&
          passwordController.text == user['password']) {

        Navigator.pushReplacementNamed(context, '/home');

      } else {

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email atau Password salah'),
          ),
        );
      }
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

            child: Column(
              children: [

                const SizedBox(height: 40),

                const Align(
                  alignment: Alignment.centerLeft,

                  child: Text(
                    "SNEAKER\nSTORE",

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  height: 220,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),

                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                Container(
                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(25),
                  ),

                  child: Form(
                    key: formKey,

                    child: Column(
                      children: [

                        CustomTextField(
                          hint: 'Email',
                          icon: Icons.email,
                          controller: emailController,
                          validator: Validators.email,
                        ),

                        const SizedBox(height: 20),

                        CustomTextField(
                          hint: 'Password',
                          icon: Icons.lock,
                          obscureText: true,
                          controller: passwordController,
                          validator: Validators.password,
                        ),

                        const SizedBox(height: 30),

                        CustomButton(
                          text: 'LOGIN',
                          onPressed: login,
                        ),

                        const SizedBox(height: 20),

                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/register',
                            );
                          },

                          child: const Text(
                            'Create New Account',

                            style: TextStyle(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}