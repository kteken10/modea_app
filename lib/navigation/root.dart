import 'package:flutter/material.dart';

import '../screens/auth/auth.dart';

import '../screens/product_detail/product_detail.dart';
import '../screens/start/start.dart';
import '../ui/bottom_nav.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modéa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/start',  
      routes: {
        '/start': (context) => const StartScreen(),
        '/auth': (context) => const AuthScreen(),
        '/bottomNav': (context) => const BottomNavBar(),
       '/productDetail': (context) => const ProductDetailScreen(),// Valeurs par défaut, elles seront remplacées via arguments
      },
    );
  }
}
