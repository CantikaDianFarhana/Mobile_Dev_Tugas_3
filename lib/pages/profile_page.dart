import 'package:flutter/material.dart';

import '../models/user.dart';

class ProfilePage extends StatelessWidget {
  final User user;

  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            CircleAvatar(
              radius: 40, // Adjust the size of the avatar
              backgroundColor: Colors.blue, // Background color of the avatar
              child: Icon(
                Icons.person, // The icon to display
                size: 50, // Size of the icon
                color: Colors.white, // Color of the icon
              ),
            ),
            Text(
              user.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              user.email,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
            ),
            Text(
              '${user.city}, ${user.birthdate.day.toString().padLeft(2, '0')}-'
              '${user.birthdate.month.toString().padLeft(2, '0')}-'
              '${user.birthdate.year}',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Text(
              user.gender ?? 'Gender : Prefer not to tell',
              style: TextStyle(fontSize: 12, color: Colors.pink),
            ),
          ],
        ),
      ),
    );
  }
}
