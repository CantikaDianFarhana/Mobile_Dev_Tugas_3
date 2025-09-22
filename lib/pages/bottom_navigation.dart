import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/user.dart';
import 'home_page.dart';
import 'profile_page.dart';

class BottomNavigation extends StatefulWidget {
  final User user;

  const BottomNavigation({super.key, required this.user});

  static const routeName = '/navigation';

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late List<Widget> _page;
  int currentIndex = 0;

  final primaryColor = Color(0xFFF4CEB7);

  @override
  void initState() {
    super.initState();
    _page = [
      HomePage(user: widget.user),
      ProfilePage(user: widget.user),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[currentIndex],
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        color: Colors.white,
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                child: Column(
                  spacing: 8,
                  children: [
                    Icon(
                      Icons.home,
                      color: (currentIndex == 0)
                          ? primaryColor
                          : Colors.grey,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 13,
                        color: (currentIndex == 0)
                            ? primaryColor
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                child: Column(
                  spacing: 8,
                  children: [
                    Icon(
                      Icons.supervised_user_circle_outlined,
                      color: (currentIndex == 1)
                          ? primaryColor
                          : Colors.grey,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 13,
                        color: (currentIndex == 1)
                            ? primaryColor
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
