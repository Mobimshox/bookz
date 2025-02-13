import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class DetailsSee extends StatefulWidget {
  String name;
  String author;
  String image;
  String chapter;
  String about;

  DetailsSee(
      {super.key,
      required this.name,
      required this.author,
      required this.image,
      required this.chapter,
      required this.about});

  @override
  State<DetailsSee> createState() => _DetailsSeeState();
}

class _DetailsSeeState extends State<DetailsSee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E2C),
      appBar: AppBar(
        backgroundColor: Color(0xFF1E1E2C),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 61,
        leading: Builder(builder: (context) {
          return Container(
            height: 45,
            width: 45,
            margin: EdgeInsets.only(left: 16, right: 0, top: 5, bottom: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFF2A2A3D),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white60,
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 8),
              onPressed: () {
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
              color: Color(0xFF2A2A3D),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white60,
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
              height: 400,
              child: Row(
                children: [
                  Expanded(
                    child: FocusedMenuHolder(
                      menuWidth: 70,
                      menuBoxDecoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      onPressed: () {},
                      menuItems: [
                        FocusedMenuItem(
                          title: Container(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.favorite_outline,
                              size: 24,
                              color: Colors.red,
                            ),
                          ),
                          onPressed: () {},
                        ),
                        FocusedMenuItem(
                          title: Container(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.bookmark_outline,
                              size: 24,
                              color: Colors.red,
                            ),
                          ),
                          onPressed: () {},
                        )
                      ],
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(widget.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    width: 90,
                    color: Color(0xFF2A2A3D),
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
                                  widget.chapter,
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
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  widget.author,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
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
                                  fontSize: 22,
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
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          widget.about,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
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
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 16),
            height: 100,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
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
        ],
      ),
    );
  }
}
