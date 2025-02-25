import 'package:animations/animations.dart';
import 'package:bookz/animation/custom_page_route.dart';
import 'package:bookz/models/book_data.dart';
import 'package:bookz/models/color_set.dart';
import 'package:bookz/screens/details_see.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import '../models/navbar.dart';
import 'notification_page.dart';

class AllbooksPage extends StatefulWidget {
  bool isAdd = false;

  AllbooksPage({super.key, required this.isAdd});

  @override
  State<AllbooksPage> createState() => _AllbooksPageState();
}

class _AllbooksPageState extends State<AllbooksPage> {
  int selectedIndex = 0;
  final List<String> categories = [
    "Populars",
    "New Releases",
    "Trends",
  ];

  @override
  Widget build(BuildContext context) {
    bool isReturning = Navigator.canPop(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leadingWidth: 61,
        leading: widget.isAdd
            ? Builder(builder: (context) {
                return Container(
                  height: 45,
                  width: 45,
                  margin:
                      EdgeInsets.only(left: 16, right: 0, top: 5, bottom: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.greyBack,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.filter_list,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                  ),
                );
              })
            : Builder(builder: (context) {
                return Container(
                  height: 45,
                  width: 45,
                  margin:
                      EdgeInsets.only(left: 16, right: 0, top: 5, bottom: 5),
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
          'All Books',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: widget.isAdd
            ? [
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
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ]
            : [
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
      body: Stack(
        children: [
          Column(
            children: [
              widget.isAdd
                  ? SizedBox(height: 5)
                  : Container(
                      margin: EdgeInsets.only(
                          right: 16, left: 16, top: 16, bottom: 6),
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColors.greyBack,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Stack(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: List.generate(
                                  categories.length,
                                  (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            categories[index],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: selectedIndex == index
                                                  ? Colors.white
                                                  : Colors.white
                                                      .withOpacity(0.5),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              AnimatedPositioned(
                                duration: Duration(milliseconds: 300),
                                left: _getTextOffset(
                                    selectedIndex, constraints.maxWidth),
                                bottom: 4,
                                child: Container(
                                  width: _getTextWidth(selectedIndex),
                                  height: 3,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        item(books[index]),
                        if (index == books.length - 1) SizedBox(height: 90),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.8),
                    Colors.black
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  double _getTextWidth(int index) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: categories[index],
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.width;
  }

  double _getTextOffset(int index, double maxWidth) {
    double totalTextWidth = _getTotalTextWidth();
    double spaceBetweenTexts =
        (maxWidth - totalTextWidth) / (categories.length);

    if (index == 0) {
      return spaceBetweenTexts / 2 + 11;
    } else if (index == categories.length - 1) {
      return maxWidth - _getTextWidth(index) - spaceBetweenTexts / 2 - 10;
    } else {
      double offset = spaceBetweenTexts / 2;
      for (int i = 0; i < index; i++) {
        offset += _getTextWidth(i) + spaceBetweenTexts;
      }
      return offset;
    }
  }

  double _getTotalTextWidth() {
    double totalWidth = 0;
    for (int i = 0; i < categories.length; i++) {
      totalWidth += _getTextWidth(i);
    }
    return totalWidth;
  }

  Widget item(Book book) {
    return OpenContainer(
      closedElevation: 0,
      openElevation: 0,
      closedColor: Colors.transparent,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      transitionType: ContainerTransitionType.fade,
      transitionDuration: Duration(milliseconds: 600),
      closedBuilder: (context, openContainer) {
        return GestureDetector(
          onTap: openContainer,
          child: Container(
            margin: EdgeInsets.only(right: 16, left: 16, top: 16),
            padding: EdgeInsets.all(16),
            width: double.infinity,
            height: 170,
            decoration: BoxDecoration(
              color: AppColors.greyBack,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 15),
                  height: double.infinity,
                  width: 115,
                  decoration: BoxDecoration(
                    color: AppColors.greyBBack,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(book.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              book.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              book.author,
                              style: TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            Row(
                              children: List.generate(5, (index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 3),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),
                                );
                              }),
                            ),
                            SizedBox(height: 7),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Free",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 2, top: 01),
                              alignment: Alignment.center,
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white30,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: LikeButton(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                likeBuilder: (bool isLiked) {
                                  return Icon(
                                    isLiked
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                    color: isLiked ? Colors.white : Colors.black45,
                                    size: 28,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      openBuilder: (context, _) {
        return DetailsSee(book: book);
      },
    );
  }
}
