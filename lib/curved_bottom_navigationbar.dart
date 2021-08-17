import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator_demo/bmi/bmipage.dart';
import 'package:flutter_calculator_demo/main.dart';

class CurvedBottomNavigation extends StatefulWidget {
  @override
  _CurvedBottomNavigationState createState() => _CurvedBottomNavigationState();
}

class _CurvedBottomNavigationState extends State<CurvedBottomNavigation> {
  int _page = 0;
  final List<Widget>_pagesnew=[
    MyHomePage('title'),
    BmiPage(),
  ];

  // @override
  // void initState() {
  //   _pages = [
  //     {'page': BmiPage(), 'title': 'Flexi BMI'},
  //     {'page': Calculator(), 'title': 'Flexi Calc'}
  //   ];
  //   super.initState();
  // }

  void selectPage(index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pagesnew[_page],
        bottomNavigationBar: CurvedNavigationBar(
          height: 70,
          animationDuration: Duration(milliseconds: 250),
          buttonBackgroundColor: Colors.yellow,
          backgroundColor: Colors.white,
          color: Colors.grey,
          index: _page,
          letIndexChange: (index) => true,
          animationCurve: Curves.easeInOut,
          onTap: selectPage,
          items: [
            Icon(
              Icons.calculate,
              size: 30,
            ),
            Icon(
              Icons.person_outline,
              size: 30,
            ),
          ],
        ),
    );
  }
}
