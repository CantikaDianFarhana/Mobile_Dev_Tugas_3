import 'package:flutter/material.dart';

import 'models/cake.dart';
import 'models/user.dart';
import 'pages/bottom_navigation.dart';
import 'pages/detail_home_page.dart';
import 'pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/register',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/register':
            return MaterialPageRoute(builder: (_) => const RegisterPage());
          case '/navigation':
            final args = settings.arguments as User;
            return MaterialPageRoute(
              builder: (_) => BottomNavigation(user: args),
            );
          case '/detail-home':
            final args = settings.arguments as Cake;
            return MaterialPageRoute(builder: (_) => DetailHome(cake: args));
          default:
            return MaterialPageRoute(
              builder: (_) => Scaffold(
                body: Center(child: Text('Unknown Route: ${settings.name}')),
              ),
            );
        }
      },
    );
  }
}
