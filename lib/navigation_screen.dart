import 'package:flutter/material.dart';
import 'package:proteinium/viewmodel/bottom_nav_viewmodel.dart';
import 'package:proteinium/views/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:proteinium/resources/color_const.dart';
import 'package:proteinium/resources/text_style_const.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.background,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'P R O T E N I U M',
          style: TextStyleConst.michromaMedium22.copyWith(
            color: ColorConst.surface,
          ),
        ),
        backgroundColor: ColorConst.primary,
        actions: const [
          Icon(
            Icons.notifications_outlined,
            color: ColorConst.surface,
          ),
          SizedBox(width: 8,)
        ],
      ),
      body: Consumer<BottomNavViewModel>(
        builder: (context, provider, child) {
          final List<Widget> pages = [
            const HomeScreen(),
            const Center(child: Text('Meal Screen')),
            const Center(child: Text('Profile Screen')),
            const Center(child: Text('More')),
          ];
          return pages[provider.currentIndex];
        },
      ),
      bottomNavigationBar: Consumer<BottomNavViewModel>(
        builder: (context, provider, child) {
          return BottomNavigationBar(
            currentIndex: provider.currentIndex,
            onTap: (index) => provider.updateIndex(index),
            selectedItemColor: ColorConst.surface,
            unselectedItemColor: ColorConst.background,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                backgroundColor: ColorConst.primary,
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_outlined),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz_outlined),
                label: 'more',
              ),
            ],
          );
        },
      ),
    );
  }
}
