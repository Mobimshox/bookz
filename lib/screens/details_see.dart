import 'package:bookz/screens/details_read.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../animation/custom_page_route.dart';
import '../models/book_data.dart';
import '../models/color_set.dart';

class DetailsSee extends StatefulWidget {
  final Book book;

  DetailsSee({
    super.key,
    required this.book,
  });

  @override
  State<DetailsSee> createState() => _DetailsSeeState();
}

class _DetailsSeeState extends State<DetailsSee> {
  bool isReturning = false;

  Future<bool> _onWillPop() async {
    setState(() {
      isReturning = true;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    double screenW = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 8),
                onPressed: () {
                  setState(() {
                    isReturning = true;
                  });
                  Navigator.pop(context);
                },
              ),
            );
          }),
          title: Text(
            'Book details',
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
                  Icons.more_vert,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.only(left: 16, top: 24, bottom: 16),
                height: screenH * 0.5,
                child: Row(
                  children: [
                    Expanded(
                      child: HeroMode(
                        enabled: isReturning,
                        child: Hero(
                          tag: widget.book.name,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.redText,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(widget.book.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      width: screenW * 0.125,
                      color: AppColors.greyBack,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "93",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 27),
                                  ),
                                  Text(
                                    "Stock",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.book.chapter,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 27),
                                  ),
                                  Text(
                                    "Chapter",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "4.6",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 27),
                                  ),
                                  Text(
                                    "Rating",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 16, left: 16, bottom: 10),
                      height: screenH * 0.07,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.book.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenH * 0.03,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    widget.book.author,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: screenH * 0.018,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 80,
                            child: Center(
                              child: Text(
                                "Free",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: screenH * 0.03,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenH * 0.024,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.book.about,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: screenH * 0.018,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: screenH * 0.03,
                    top: screenH * 0.02),
                height: screenH * 0.125,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.redText,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Read the book",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  CustomPageRoute(
                    page: DetailsRead(book: widget.book,),
                    beginOffset: Offset(1.0, 0.0),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
