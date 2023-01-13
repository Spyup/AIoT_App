import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MainClass(),
    );
  }
}

class MainClass extends StatefulWidget {
  MainClass({Key, key}) : super(key: key);

  @override
  _MainClassState createState() => _MainClassState();
}

class _MainClassState extends State<MainClass> {
  PageController _pageController = new PageController();

  List<Widget> _screens = [MenuPage(), HomePage(), HistoryPage()];

  int _selectedIndex = 1;

  void _onPagedChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Container(
            color: Colors.black,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: GNav(
                backgroundColor: Colors.black,
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.grey.shade800,
                gap: 8,
                // When change tab then print something
                onTabChange: (index) {
                  print("Change" + index.toString());
                  _onPagedChanged(index);
                  //_onItemTapped(index);
                },
                padding: EdgeInsets.all(16),
                tabs: const [
                  GButton(
                    icon: Icons.menu,
                    text: 'Menu',
                  ),
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.history,
                    text: 'History',
                  ),
                ],
                selectedIndex: _selectedIndex,
              ),
            )));
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu")),
      body: _MenuPage(),
    );
  }
}

class _MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Here!!!!"));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Home?????"));
  }
}

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("History")),
      body: _HistoryPage(),
    );
  }
}

class _HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("History?????"));
  }
}
