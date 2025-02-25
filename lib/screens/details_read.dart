import 'package:bookz/models/color_set.dart';
import 'package:flutter/material.dart';

import '../models/book_data.dart';

class DetailsRead extends StatefulWidget {
  final Book book;

  DetailsRead(
      {super.key,
      required this.book});

  @override
  State<DetailsRead> createState() => _DetailsReadState();
}

class _DetailsReadState extends State<DetailsRead> {
  late List<String> pages;
  PageController _pageController = PageController();
  int currentPage = 0;
  bool isLiked = false;
  bool disLiked = false;

  @override
  void initState() {
    super.initState();
    pages = _splitTextIntoPages(widget.book.main, 1000);
  }

  List<String> _splitTextIntoPages(String text, int pageSize) {
    List<String> result = [];
    for (int i = 0; i < text.length; i += pageSize) {
      result.add(text.substring(
          i, i + pageSize > text.length ? text.length : i + pageSize));
    }
    return result;
  }

  void _nextPage() {
    if (currentPage < pages.length - 1) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _previousPage() {
    if (currentPage > 0) {
      _pageController.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leadingWidth: 61,
        leading: Builder(
          builder: (context) {
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
                  Navigator.pop(context);
                },
              ),
            );
          },
        ),
        title: Text(
          widget.book.name,
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
                Icons.info_outline,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: widget.book.main.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/not.png", width: 200),
                  SizedBox(height: 10),
                  Text("Text is not available!",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  SizedBox(height: 40),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    itemCount: pages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          child: Text(pages[index],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                              textAlign: TextAlign.justify),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.greyBack,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: currentPage > 0 ? _previousPage : null,
                      ),
                      Text(
                        "${currentPage + 1}/${pages.length}",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      IconButton(
                        icon:
                            Icon(Icons.arrow_forward_ios, color: Colors.white),
                        onPressed:
                            currentPage < pages.length - 1 ? _nextPage : null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
