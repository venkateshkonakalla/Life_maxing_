import 'package:flutter/material.dart';
import 'theme/dark_theme.dart';

import 'screens/home_screen.dart';
import 'screens/routine_screen.dart';
import 'screens/ai_chat_screen.dart';
import 'screens/profile_screen.dart';

class LifeMaxApp extends StatefulWidget {
  const LifeMaxApp({super.key});

  @override
  State<LifeMaxApp> createState() => _LifeMaxAppState();
}

class _LifeMaxAppState extends State<LifeMaxApp> {
  int _index = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    RoutineScreen(),
    AIChatScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Life Maxing",
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: Scaffold(
        body: _pages[_index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          onTap: (i) => setState(() => _index = i),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_circle),
              label: "Routine",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.smart_toy),
              label: "AI Chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
