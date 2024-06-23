import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:price_flutter_app/constants/colors.dart';
import 'package:price_flutter_app/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.blue,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LottieBuilder.asset("assets/lottie/coin_animation.json"),
                    const Text(
                      textAlign: TextAlign.center,
                      "Hello, welcome to Price App",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              bottom: 32.0,
              child: Column(
                children: [
                  Text(
                    "From",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Sepi",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
