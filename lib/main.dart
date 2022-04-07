import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:merrily/screen/unloginpage.dart';
import 'package:firebase_core/firebase_core.dart';

import './screen/home.dart';
import './screen/daily.dart';
import './screen/favorite.dart';
import 'screen/unloginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final auth = FirebaseAuth.instance;

  int _selectedPage = 0;
  final _pageOptions = [Home(), Daily(), Favorite(), Unlogin()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          scaffoldBackgroundColor: const Color(0xff643ff9),
          fontFamily: 'Kanit '),
      home: Scaffold(
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(fontFamily: 'Kanit'),
          unselectedLabelStyle: TextStyle(fontFamily: 'Kanit'),
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'หน้าหลัก',
                backgroundColor: Color(0xff643ff9)),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_outlined),
                activeIcon: Icon(Icons.calendar_today),
                label: 'ประจำวัน',
                backgroundColor: Color(0xff643ff9)),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                activeIcon: Icon(Icons.favorite),
                label: 'การ์ตูนของฉัน',
                backgroundColor: Color(0xff643ff9)),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'ตั้งค่า',
                backgroundColor: Color(0xff643ff9)),
          ],
          elevation: 0,
        ),
      ),
    );
  }
}
