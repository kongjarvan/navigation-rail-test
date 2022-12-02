import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_rail/first_page.dart';
import 'package:navigation_rail/second_page.dart';
import 'package:navigation_rail/third_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> selectedMainView = [
    FirstPage(),
    SecondPage(),
    ThirdPage(),
  ];

  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            labelType: NavigationRailLabelType.all,
            minWidth: 80,
            destinations: <NavigationRailDestination>[
              NavigationRailDestination(icon: Icon(CupertinoIcons.airplane), label: Text('비행기!')),
              NavigationRailDestination(icon: Icon(CupertinoIcons.shopping_cart), label: Text('장바구니!')),
              NavigationRailDestination(icon: Icon(CupertinoIcons.person_alt), label: Text('이성진 상반신!')),
            ],
            selectedIndex: _selectedIndex,
            groupAlignment: -1,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          VerticalDivider(thickness: 1, width: 1),
          Container(
            child: selectedMainView[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
