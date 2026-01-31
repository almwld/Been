import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50, backgroundColor: Colors.deepPurple),
            SizedBox(height: 10),
            Text('Username', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text('user@email.com', style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('Edit Profile')),
            ElevatedButton(onPressed: () {}, child: Text('Settings')),
            ElevatedButton(
              onPressed: () => themeProvider.toggleTheme(),
              child: Text('Toggle Theme'),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Logout')),
          ],
        ),
      ),
    );
  }
}
