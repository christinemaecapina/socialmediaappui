import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'message_screen.dart';
import 'notifications_screen.dart';
import 'communities_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const XHomePage(),
    const SearchScreen(),
    const CommunitiesScreen(),
    const NotificationsScreen(),
    const MessageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      // Wrapped in a container to give it that exact top border X has
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xFF2F3336), width: 0.5),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(0xFF71767B),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 26, // Slightly smaller, more refined size
          elevation: 0,
          // Switching between Outlined (inactive) and Filled (active) icons
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home_filled),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                activeIcon: Icon(Icons.search), // FIXED: Removed strokeWidth
                label: "Search"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_outline),
                activeIcon: Icon(Icons.people),
                label: "Communities"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none),
                activeIcon: Icon(Icons.notifications),
                label: "Notifications"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.mail_outline),
                activeIcon: Icon(Icons.mail),
                label: "Messages"
            ),
          ],
        ),
      ),
    );
  }
}