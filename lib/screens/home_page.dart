import 'package:bookz/animation/animated_page.dart';
import 'package:bookz/animation/custom_page_route.dart';
import 'package:bookz/models/book_details.dart';
import 'package:bookz/screens/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:bookz/models/book_data.dart';
import 'package:bookz/models/color_set.dart';
import '../models/navbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  double pageValue = 0.0;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // movies = Movie.rawData
    //     .map((data) =>
    //     Movie(title: data['title'], img: data['img'], index: data['index']))
    //     .toList();
    _pageController =
        PageController(viewportFraction: 0.8, initialPage: currentIndex)
          ..addListener(() {
            setState(() {
              pageValue = _pageController.page!;
            });
          });
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
          'Home',
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 12),
            child: Text(
              'Which book do\nyou want to buy?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 16,
              left: 16,
              top: 16,
              bottom: 12,
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.greyBack,
                hintText: 'Search book',
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
              child: AnimatedPage(
            pageController: _pageController,
            pageValue: pageValue,
            pageCount: books.length,
            onChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            child: (index, context) {
              return BookDetails(book: books[index]);
            },
          )),
        ],
      ),
    );
  }
}
