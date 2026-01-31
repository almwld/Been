import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../products/products_page.dart';
import '../cart/cart_page.dart';
import '../profile/profile_page.dart';
import '../../providers/theme_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    ProductsPage(),
    CartPage(),
    ProfilePage(),
  ];

  final List<String> _icons = [
    'assets/icons/home.svg',
    'assets/icons/cart.svg',
    'assets/icons/profile.svg'
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
        items: List.generate(3, (index) => BottomNavigationBarItem(
              icon: SvgPicture.asset(_icons[index], width: 25, height: 25),
              label: ['Home', 'Cart', 'Profile'][index],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(themeProvider.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
        onPressed: () => themeProvider.toggleTheme(),
      ),
    );
  }
}
