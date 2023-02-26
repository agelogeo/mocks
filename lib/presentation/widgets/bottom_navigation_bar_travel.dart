import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigationBarTravel extends StatefulWidget {
  const BottomNavigationBarTravel({super.key});

  @override
  State<BottomNavigationBarTravel> createState() =>
      _BottomNavigationBarTravelState();
}

class _BottomNavigationBarTravelState extends State<BottomNavigationBarTravel> {
  int _selectedIndex = 0;

  TextStyle bottomNavStyle =
      GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: _selectedIndex == 0
                ? SvgPicture.asset('assets/svg/icon_home_colored.svg')
                : SvgPicture.asset('assets/svg/icon_home.svg'),
          ),
          BottomNavigationBarItem(
            label: 'Heart',
            icon: _selectedIndex == 1
                ? SvgPicture.asset('assets/svg/icon_heart_colored.svg')
                : SvgPicture.asset('assets/svg/icon_heart.svg'),
          ),
          BottomNavigationBarItem(
            label: 'Notification',
            icon: _selectedIndex == 2
                ? SvgPicture.asset('assets/svg/icon_plus_colored.svg')
                : SvgPicture.asset('assets/svg/icon_plus.svg'),
          ),
          BottomNavigationBarItem(
            label: 'Notification',
            icon: _selectedIndex == 3
                ? SvgPicture.asset('assets/svg/icon_notification_colored.svg')
                : SvgPicture.asset('assets/svg/icon_notification.svg'),
          ),
          BottomNavigationBarItem(
            label: 'User',
            icon: _selectedIndex == 4
                ? SvgPicture.asset('assets/svg/icon_user_colored.svg')
                : SvgPicture.asset('assets/svg/icon_user.svg'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
