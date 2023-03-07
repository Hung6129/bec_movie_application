import 'package:bec_movie_application/views/helpers/palettes.dart';
import 'package:bec_movie_application/views/view/favorite_page.dart';
import 'package:bec_movie_application/views/view/search_page.dart';
import 'package:flutter/material.dart';

import 'package:bec_movie_application/views/view/home_page/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    FavoritePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Palettes.p2,
        unselectedItemColor: Palettes.p2.withOpacity(0.2),
        onTap: _onItemTapped,
      ),
    );
  }
}
