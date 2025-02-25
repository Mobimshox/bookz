import 'package:flutter/material.dart';
import '../models/color_set.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool _isLoading = false;

  Future<void> _refreshNotifications() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leadingWidth: 61,
        leading: Container(
          margin: EdgeInsets.only(left: 16, top: 5, bottom: 5),
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
        title: Text(
          "Back",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshNotifications,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height - 100,
            alignment: Alignment.center,
            child: _isLoading
                ? Container()
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/mute.png",
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                Text(
                  "No notifications",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
