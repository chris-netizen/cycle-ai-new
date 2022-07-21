import 'package:flutter/material.dart';

import '../../filesforimport.dart';
import 'Accounts.dart';
import 'homepage.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [
    const HomePage(),
    const Accounts()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(
              () {
                currentIndex = index;
              },
            );
          },
          selectedItemColor: kMainPrimaryColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Account',
            ),
          ]),
    );
  }
}
