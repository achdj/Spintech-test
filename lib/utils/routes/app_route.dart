import 'package:flutter/material.dart';
import 'package:spintech/screen/home.dart';
import 'package:spintech/screen/onboarding.dart';

class AppRoute {
  static Map<String, Widget Function(BuildContext)> allRoutes = {
    '/on_boarding': (context) => const Onboarding(),
    '/home': (context) => const HomePage()
  };
}