import 'package:flutter/material.dart';
import 'inbox_screen.dart'; // Add this line!
import 'discover_screen.dart';
import '../widgets/custom_add_icon.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0; // 0 for Home, 4 for Profile

// List of screens for the bottom nav
  final List<Widget> _screens = [
    const HomeScreen(),
    const DiscoverScreen(), // <--- REPLACE THE PLACEHOLDER WITH THIS
    const Scaffold(body: Center(child: Text('Add Video'))),
    const InboxScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isHome = _currentIndex == 0;
    final navBackgroundColor = isHome ? Colors.black : Colors.white;
    final navItemColor = isHome ? Colors.white : Colors.black;
    final navUnselectedColor = Colors.grey;

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: isHome ? Colors.black : Colors.grey.shade300,
              width: 0.5,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: navBackgroundColor,
          selectedItemColor: navItemColor,
          unselectedItemColor: navUnselectedColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          items: [
            const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Discover'),
            BottomNavigationBarItem(icon: CustomAddIcon(isHome: isHome), label: ''),
            const BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Inbox'),
            const BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Me'),
          ],
        ),
      ),
    );
  }
}