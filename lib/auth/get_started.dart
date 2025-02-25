import 'package:bookz/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/color_set.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Container(
                color: AppColors.background,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(image: AssetImage("assets/images/rocket_ill.png")),
                    SizedBox(height: 20),
                    Text(
                      "Discover the Joy of Reading",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Reading fuels your imagination\nand expands your mind!",
                      style: TextStyle(
                          fontSize: 12, color: Colors.white.withOpacity(0.6)),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 3),
                  ],
                ),
              ),
              Container(
                color: AppColors.background,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(image: AssetImage("assets/images/books_ill.png")),
                    SizedBox(height: 20),
                    Text(
                      "Explore Endless Stories",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Every book is a new world!",
                      style: TextStyle(
                          fontSize: 12, color: Colors.white.withOpacity(0.6)),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      color: AppColors.background,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(image: AssetImage("assets/images/secure_ill.png")),
                          SizedBox(height: 20),
                          Text(
                            "Your Personal Book Haven",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "All your favorite books in one place!",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.6)),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 7,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 32,
                        height: 60,
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.redText,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            alignment: Alignment(0, 0.7),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: WormEffect(
                dotHeight: 6,
                dotWidth: 70,
                spacing: 20,
                activeDotColor: AppColors.redText,
                dotColor: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
