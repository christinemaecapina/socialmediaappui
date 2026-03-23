import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'screens/main_layout.dart';

void main() {
  runApp(const XCloneApp());
}

class XCloneApp extends StatelessWidget {
  const XCloneApp({super.key});
=======
import 'screens/main_navigation.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});
>>>>>>> 42910258dedd46af3f05ff711dec5bad285bec19

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      debugShowCheckedModeBanner: false,
      title: 'X Clone',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        // The official X Blue color
        primaryColor: const Color(0xFF1D9BF0),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF1D9BF0),
          secondary: Color(0xFF1D9BF0),
          surface: Colors.black,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        dividerTheme: const DividerThemeData(
          // The exact subtle grey border X uses
          color: Color(0xFF2F3336),
          thickness: 0.5,
          space: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          // The exact muted text/icon color X uses
          unselectedItemColor: Color(0xFF71767B),
        ),
        fontFamily: 'Segoe UI', // Uses system sans-serif but enforces clean look
      ),
      home: const MainLayout(),
=======
      title: 'TikTok',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const MainNavigationScreen(),
>>>>>>> 42910258dedd46af3f05ff711dec5bad285bec19
    );
  }
}