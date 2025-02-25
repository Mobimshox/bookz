import 'package:bookz/models/color_set.dart';
import 'package:bookz/screens/allbooks_page.dart';
import 'package:bookz/screens/favourite_page.dart';
import 'package:bookz/screens/home_page.dart';
import 'package:bookz/pages/profile_page.dart';
import 'package:bookz/screens/rate_page.dart';
import 'package:bookz/screens/save_page.dart';
import 'package:bookz/screens/settings_page.dart';
import 'package:bookz/screens/support_page.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../auth/login_page.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  static void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final user = FirebaseAuth.instance.currentUser;
  int _selectedIndex = 0;

  List<Widget> pages = [
    HomePage(),
    AllbooksPage(isAdd: false),
    SavePage(isFromHome: true),
    SettingsPage(),
  ];

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _signOut(BuildContext context) async {
    await _auth.signOut();
    await _googleSignIn.signOut();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      key: Navbar.scaffoldKey,
      drawer: Drawer(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: AppColors.background,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 120,
              color: Color(0xFF1E1E2C),
              child: Center(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 36),
                      padding: EdgeInsets.only(left: 6),
                      height: 45,
                      width: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.greyBack,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Menu",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _drawerElement(
                img: "assets/icons/user.png",
                title: "Profile",
                tap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ProfilePage()));
                }),
            _drawerElement(
                img: "assets/icons/heart.png",
                title: "Favourite",
                tap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => FavouritePage()));
                }),
            _drawerElement(
                img: "assets/icons/bookmark.png",
                title: "Save",
                tap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => SavePage(isFromHome: false)));
                }),
            _drawerElement(
                img: "assets/icons/star.png",
                title: "Rate",
                tap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => RatePage()));
                }),
            _drawerElement(
                img: "assets/icons/headset.png",
                title: "Support",
                tap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SupportPage()));
                }),
          ],
        ),
      ),
      body: Stack(
        children: [
          pages[_selectedIndex],
          Positioned(
            right: 10,
            left: 10,
            bottom: 20,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: AppColors.greyBack,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: CustomNavigationBar(
                  elevation: 0,
                  iconSize: 30,
                  borderRadius: Radius.circular(15),
                  backgroundColor: Colors.transparent,
                  selectedColor: Colors.white,
                  unSelectedColor: Colors.grey,
                  strokeColor: Colors.white,
                  items: [
                    CustomNavigationBarItem(
                      selectedIcon: _navIconSelected(Icons.home),
                      icon: Icon(Icons.home_outlined),
                    ),
                    CustomNavigationBarItem(
                      selectedIcon: _navIconSelected(Icons.grid_view_sharp),
                      icon: Icon(Icons.grid_view_outlined),
                    ),
                    CustomNavigationBarItem(
                      selectedIcon: _navIconSelected(Icons.bookmark),
                      icon: Icon(Icons.bookmark_outline),
                    ),
                    CustomNavigationBarItem(
                      selectedIcon: _navIconSelected(Icons.settings),
                      icon: Icon(Icons.settings_outlined),
                    ),
                  ],
                  onTap: (index) {
                    if (index >= 0 && index < pages.length) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    }
                  },
                  currentIndex: _selectedIndex,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerElement({img, title, Function()? tap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(13),
          height: 45,
          width: 45,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: AppColors.greyBack),
          child: Image(
            image: AssetImage(
              img,
            ),
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        trailing: Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.greyBack,
            borderRadius: BorderRadius.circular(11),
          ),
          child: IconButton(
            onPressed: tap,
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
        onTap: () {},
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        selectedTileColor: Colors.transparent,
      ),
    );
  }

  Widget _navIconSelected(icon) {
    return Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.redText, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Icon(
            icon,
            size: 24,
          ),
        ),
      ),
    );
  }
}
