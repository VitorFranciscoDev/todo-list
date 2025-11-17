import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/infrastructure/presentation/auth/settings_screen.dart';
import 'package:to_do_list/infrastructure/presentation/tasks/today_screen.dart';
import 'package:to_do_list/infrastructure/presentation/tasks/upcoming_screen.dart';
import 'package:to_do_list/infrastructure/presentation/widgets/bottom-navigator/bottom_navigator_state.dart';

class BottomNavigator extends StatelessWidget {
  BottomNavigator({super.key});

  final List<Widget> _pages = [
    TodayScreen(),
    UpcomingScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final index = context.watch<BottomNavigatorProvider>().index;

    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            currentIndex: index,
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromARGB(255, 205, 205, 205),
            selectedItemColor: Colors.redAccent,
            unselectedItemColor: Colors.red,
            selectedFontSize: 12,
            unselectedFontSize: 11,
            onTap: (newIndex) => context.read<BottomNavigatorProvider>().index = newIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 26),
                activeIcon: Icon(Icons.home, size: 26),
                label: "Today",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_location_alt_outlined, size: 26),
                activeIcon: Icon(Icons.add_location_alt, size: 26),
                label: "Upcoming",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined, size: 26),
                activeIcon: Icon(Icons.settings, size: 26),
                label: "Settings",
              ),
            ],
          ),
        ),
      ),
    );
  }
}