import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/home/home_page.dart';
import 'screens/auth/login_page.dart';
import 'services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initializeFirebase();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: BeenMarketApp(),
    ),
  );
}

class BeenMarketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Been Market v5.1 Ultra Pro',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.isDarkMode
          ? ThemeData.dark()
          : ThemeData(
              primarySwatch: Colors.deepPurple,
              accentColor: Colors.deepPurpleAccent,
              fontFamily: 'Roboto',
            ),
      home: FirebaseAuth.instance.currentUser != null ? HomePage() : LoginPage(),
    );
  }
}
