import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:berry_club_flutter/home_page.dart';
import 'package:flutter/material.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  var selectedIndex = 1;

  final _destinations = <AdaptiveScaffoldDestination>[
    const AdaptiveScaffoldDestination(title: 'Home', icon: Icons.home),
    const AdaptiveScaffoldDestination(
        title: 'Other Page', icon: Icons.table_bar),
  ];

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = const Placeholder();
        break;
      default:
        throw UnimplementedError('page not implemented');
    }

    return AdaptiveNavigationScaffold(
      body: page,
      selectedIndex: selectedIndex,
      destinations: _destinations,
      onDestinationSelected: (value) => {
        setState(() {
          selectedIndex = value;
        })
      },
    );
  }
}
