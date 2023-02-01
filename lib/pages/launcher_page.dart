

import 'package:flutter/material.dart';
import 'package:mechanic_koi/pages/Welcome/welcome_screen.dart';

import '../auth/auth_service.dart';
import '../custom_widgets/bottom_nav_bar_wrapper_page.dart';
import 'bottom_nav_bar_page.dart';

class LauncherPage extends StatelessWidget {
  static const String routeName = '/';

  const LauncherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      if (AuthService.currentUser != null) {
        Navigator.pushReplacementNamed(context, BottomNavBarPageWrapper.routeName);
      } else {
        Navigator.pushReplacementNamed(context, WelcomeScreen.routeName);
      }
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
