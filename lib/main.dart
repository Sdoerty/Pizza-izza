import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NavigationBarWidget(),
    );
  }
}

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.restaurant),
            label: 'Меню',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag),
            label: 'Корзина',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          alignment: Alignment.center,
          child: const Text('Меню'),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text('Корзина'),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
      ][currentPageIndex],
    );
  }
}

