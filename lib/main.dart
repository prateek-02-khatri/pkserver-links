import 'package:flutter/material.dart';

import 'splash_screen.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(DeepLinkingApp());

}

class DeepLinkingApp extends StatelessWidget {
  const DeepLinkingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Deep Linking",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: SplashScreen(),
    );
  }
}
