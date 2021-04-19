// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hs/Screens/Home%20Screens/Account.dart';
import 'package:hs/Screens/Home%20Screens/Search.dart';
import 'package:hs/Screens/Home%20Screens/Featured.dart';
import 'package:hs/Screens/Home%20Screens/Wishlist.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = new PageController();
  int currentindex = 0;
  // final _firebaseMessaging = FirebaseMessaging();
  // String _message;

  void onTap(int page) {
    setState(() {
      currentindex = page;
    });
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff25282B),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            currentindex = index;
          });
        },
        controller: pageController,
        children: [
          Featured(),
          Search(),
          Wishlist(),
          Account(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        backgroundColor: const Color(0xff25282B),
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(color: const Color(0xff217AF1)),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.white),
        selectedLabelStyle: TextStyle(color: Colors.blue),
        iconSize: 26.0,
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        currentIndex: currentindex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            // ignore: deprecated_member_use
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            // ignore: deprecated_member_use
            title: Text("Search"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            // ignore: deprecated_member_use
            title: Text("Wishlist"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            // ignore: deprecated_member_use
            title: Text("Account"),
          ),
        ],
      ),
    );
  }
}
