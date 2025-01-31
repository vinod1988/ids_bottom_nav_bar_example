import 'package:flutter/material.dart';
import 'package:ids_material_sdk/bottom_nav_bar/index.dart';
import 'task_page.dart'; // Assuming TaskPage exists
import 'demo_page.dart'; // Assuming DemoPage exists
import 'home_page.dart'; // Assuming HomePage exists

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<IDSBottomNavigationAppBarState> _bottomNavBarKey =
      GlobalKey<IDSBottomNavigationAppBarState>();

  int _currentIndex = 0;

  /// List of pages corresponding to each tab
  final List<Widget> _pages = [
    HomePage(),
    DemoPage(),
    Center(child: Text("Profile Screen", style: TextStyle(fontSize: 24))),
    Center(child: Text("Settings Screen", style: TextStyle(fontSize: 24))),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("IDS Bottom Navigation Example")),
      body: _pages[_currentIndex], // Show the selected page

      // Middle floating action button
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 0, top: 30, right: 0, bottom: 0),
        child: IDSFloatingActionButton(
          onPressed: () {
            print("Middle FAB pressed");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TaskPage()),
            );
          },
          isSelected: false,
          activeColor: Colors.blue,
          inactiveColor: Colors.amber,
          icon: Icon(Icons.add),
          enableShadow: true,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Custom Bottom Navigation Bar
      bottomNavigationBar: IDSBottomNavigationAppBar(
        key: _bottomNavBarKey,
        items: [
          IDSBottomNavBarItem(
            activeIcon: Icon(Icons.home),
            inActiveIcon: Icon(Icons.home_outlined),
            text: 'Home',
          ),
          IDSBottomNavBarItem(
            activeIcon: Icon(Icons.search),
            inActiveIcon: Icon(Icons.search_outlined),
            text: 'Search',
          ),
          IDSBottomNavBarItem(
            activeIcon: Icon(Icons.person),
            inActiveIcon: Icon(Icons.person_outline),
            text: 'Profile',
          ),
          IDSBottomNavBarItem(
            activeIcon: Icon(Icons.settings),
            inActiveIcon: Icon(Icons.settings_outlined),
            text: 'Settings',
          ),
        ],
        centerItemText: '',
        backgroundColor: Colors.white,
        activeColor: Colors.blue,
        inActiveColor: Colors.grey,
        enableMiddleTabItem: true, // Enable middle tab and FAB
        enableTopShadow: true, // enable the top shadow of bottom bar
        blurRadius: 2.0,
        spreadRadius: 0.2,
        offset: -2,
        shadowColor: Colors.black12,
        onTabSelected: (index) {
          print("Selected index: $index");
          setState(() {
            _currentIndex = index; // Update the selected tab index
          });
        },
      ),
    );
  }
}
