import 'package:flutter/material.dart';

import '../services/local_storage_service.dart';
import '../utils/app_colors.dart';
import '../pages/home_page.dart';
import '../pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const ProfilePage(),
  ];

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

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        backgroundColor: Colors.black,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.white54,

        onTap: (index) {

          if (index == 2) {
            logout();
          } else {
            setState(() {
              currentIndex = index;
            });
          }
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}