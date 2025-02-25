import 'package:flutter/material.dart';
import '../models/color_set.dart';
import 'allbooks_page.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leadingWidth: 61,
        centerTitle: true,
        leading:Container(
          margin: EdgeInsets.only(left: 16, right: 0, top: 5, bottom: 5),
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
          "Favourite Books",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 16),
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  color: AppColors.greyBack,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => AllbooksPage(isAdd: true)));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Empty Favourite",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
