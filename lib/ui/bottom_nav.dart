import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../constants/colors.dart';
import '../screens/favorite/favorite.dart';
import '../screens/home/home.dart';
import '../screens/profile/profile.dart';
import '../screens/shop/shop.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ShopScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: GNav(
              backgroundColor: Colors.white,
              rippleColor: AppColors.primary.withOpacity(0.1),
              hoverColor: AppColors.primary.withOpacity(0.1),
              gap: 4, // Réduit pour l'effet ovale
              activeColor: Colors.white,
              color: Colors.black,
              iconSize: 26,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              duration: const Duration(milliseconds: 300),
              tabBackgroundColor: AppColors.primary,
              tabBorderRadius: 20, // Forme ovale
              tabMargin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              curve: Curves.easeOutExpo,
              tabs: [
                GButton(
                  icon: _selectedIndex == 0
                      ? Icons.home_rounded
                      : Icons.home_outlined,
                  iconSize: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                GButton(
                  icon: _selectedIndex == 1
                      ? Icons.shopping_bag
                      : Icons.shopping_bag_outlined,
                  iconSize: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                GButton(
                  icon: _selectedIndex == 2
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  iconSize: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                GButton(
                  icon: _selectedIndex == 3
                      ? Icons.person_rounded
                      : Icons.person_outline_rounded,
                  iconSize: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}