import 'package:flutter/material.dart';

void main() {
  runApp(const HealthMateApp());
}

class HealthMateApp extends StatelessWidget {
  const HealthMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthMate',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Sans',
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MainScreen()),
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFFEF3B3B), // HealthMate 빨간 배경
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 로고 아이콘
            Image.asset(
              'assets/icons/home_healthmate_iconf.png',
              width: 140,
              height: 140,
              fit: BoxFit.contain, // 잘림 없이 표시
            ),
            const SizedBox(height: 24),
            const Text(
              '나의 건강을 스마트하게,',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const Text(
              'HealthMate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          '메인화면입니다',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}