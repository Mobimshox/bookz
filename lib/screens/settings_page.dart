import 'package:bookz/models/color_set.dart';
import 'package:bookz/pages/profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../animation/custom_page_route.dart';
import '../models/navbar.dart';
import '../pages/appearance_page.dart';
import '../pages/language_page.dart';
import '../pages/notifsettings_page.dart';
import '../pages/security_page.dart';
import 'notification_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool darkMode = true;

  User? user = FirebaseAuth.instance.currentUser;
  String? fullname;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    getUserFullName();
  }

  void getUserFullName() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String docID = user.uid;
      DocumentSnapshot doc =
          await FirebaseFirestore.instance.collection('users').doc(docID).get();

      if (doc.exists) {
        setState(() {
          fullname = doc['fullname'] ?? "No Name";
        });
      } else {
        print("User information not found!");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    double screenW = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leadingWidth: 61,
        leading: Builder(builder: (context) {
          return Container(
            height: 45,
            width: 45,
            margin: EdgeInsets.only(left: 16, right: 0, top: 5, bottom: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.greyBack,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              padding: EdgeInsets.zero,
              onPressed: () {
                Navbar.openDrawer();
              },
            ),
          );
        }),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16.0),
            alignment: Alignment.center,
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: AppColors.greyBack,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  CustomPageRoute(
                    page: NotificationPage(),
                    beginOffset: Offset(1.0, 0.0),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            width: screenW,
            decoration: BoxDecoration(
              color: AppColors.greyBack,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 4, bottom: 4),
                  child: Text(
                    "Accounts",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                sectionItem(
                  Icons.person,
                  fullname ?? 'Loading...',
                  "Personal Information",
                  false,
                ),
                sectionItem(
                    Icons.key, "Password & Security", "Authentication", false),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            margin: EdgeInsets.symmetric(horizontal: 16),
            width: screenW,
            decoration: BoxDecoration(
              color: AppColors.greyBack,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 4, bottom: 4),
                  child: Text(
                    "General",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                sectionItem(Icons.language, "Language", null, false),
                sectionItem(
                    Icons.edit_notifications, "Notifications", null, false),
                sectionItem(Icons.palette, "Appearence", null, false),
                sectionItem(Icons.dark_mode, "Dark Mode", null, true,
                    darkMode: darkMode, onChanged: (value) {
                  setState(() {
                    darkMode = value;
                  });
                }),
                // sectionItem(CupertinoIcons.question_circle_fill, "FAQ", null, false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionItem(
    IconData icon,
    String title,
    String? subtitle,
    bool isThemeSection, {
    bool? darkMode,
    Function(bool)? onChanged,
  }) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: EdgeInsets.only(top: 3),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: AppColors.greyBBack),
            child: Center(
              child: Icon(icon, color: Colors.white, size: 25),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
            ),
          ),
          isThemeSection
              ? CupertinoSwitch(
                  value: darkMode ?? false,
                  onChanged: onChanged ?? (value) {},
                  activeColor: AppColors.greyBBack,
                  trackColor: AppColors.greyBBack,
                )
              : GestureDetector(
                  onTap: () {
                    if (title == "Language") {
                      Navigator.push(context,
                          CustomPageRoute(page: LanguagePage(), beginOffset: Offset(1.0, 0.0)));
                    } else if (title == "Notifications") {
                      Navigator.push(context,
                          CustomPageRoute(page: NotificationPage(), beginOffset: Offset(1.0, 0.0)));
                    } else if (title == "Appearence") {
                      Navigator.push(context,
                          CustomPageRoute(page: AppearancePage(), beginOffset: Offset(1.0, 0.0)));
                    } else if (title == fullname) {
                      Navigator.push(context,
                          CustomPageRoute(page: ProfilePage(), beginOffset: Offset(1.0, 0.0)));
                    } else if (title == "Password & Security") {
                      Navigator.push(context, 
                          CustomPageRoute(page: SecurityPage(), beginOffset: Offset(1.0, 0.0)));
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.greyBBack,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
