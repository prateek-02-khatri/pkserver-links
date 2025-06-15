import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:deep_linking/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final appLinks = AppLinks();

  Timer? _timer;

  @override
  void initState() {
    _handleAppLinks();
    _init();
    super.initState();
  }

  Future<void> _init() async {
    _timer = Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
          (route) => false,
        );
      },
    );
  }

  Future<void> _handleAppLinks() async {
    appLinks.uriLinkStream.listen((url) {
      _timer?.cancel();
      print('App link url: $url');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
