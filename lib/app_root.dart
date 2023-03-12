import 'package:flutter/material.dart';

import 'pages/auth_page.dart';
import 'pages/home_page.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  var selectedIndex = 1;
  var isSignedIn = false;
  final _navRailDestinations = const <NavigationRailDestination>[
    NavigationRailDestination(label: Text('Home'), icon: Icon(Icons.home)),
    NavigationRailDestination(label: Text('Other Page'), icon: Icon(Icons.table_bar)),
    NavigationRailDestination(label: Text('Login'), icon: Icon(Icons.login)),
  ];

  final _bottomBarDestinations = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
    BottomNavigationBarItem(label: 'Other Page', icon: Icon(Icons.table_bar)),
    BottomNavigationBarItem(label: 'Login', icon: Icon(Icons.login)),
  ];

  @override
  Widget build(BuildContext context) {
    var isMobileMediaWidth = MediaQuery.of(context).size.width < 640;
    var isPcMediaWidth = MediaQuery.of(context).size.width > 1024;
    Widget page;

    switch (selectedIndex) {
      case 0:
        page = const HomePage();
        break;
      case 1:
        page = const Placeholder();
        break;
      case 2:
        page = AuthPage();
        break;
      default:
        throw UnimplementedError('page not implemented');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Berry Club'),
        actions: const [],
      ),
      bottomNavigationBar: isMobileMediaWidth
          ? BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (value) => setState(() {
                    selectedIndex = value;
                  }),
              selectedItemColor: Colors.purple,
              unselectedItemColor: Colors.grey,
              items: _bottomBarDestinations)
          : null,
      body: Row(mainAxisSize: MainAxisSize.max, children: [
        if (!isMobileMediaWidth)
          NavigationRail(
            extended: isPcMediaWidth,
            destinations: _navRailDestinations,
            selectedIndex: selectedIndex,
            onDestinationSelected: (value) => {
              setState(() {
                selectedIndex = value;
              })
            },
          ),
        Expanded(
          child: page,
        )
      ]),
    );
  }
}
