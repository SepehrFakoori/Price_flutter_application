import 'package:flutter/material.dart';
import 'package:price_flutter_app/di/di.dart';
import 'package:price_flutter_app/screens/splash/splash_screen.dart';

void main() async {
  await getItInit();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
