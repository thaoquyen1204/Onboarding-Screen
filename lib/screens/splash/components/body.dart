import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboardingscreen/constants.dart';
import 'package:onboardingscreen/size_config.dart';

import '../../../components/default_button.dart';
import 'splash_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "image": "assets/images/splash_1.png",
      "text": "Welcome to TOKOTO, Let's shop"
    },
    {
      "image": "assets/images/splash_2.png",
      "text":
          "We help people conect with store \n around United State of America",
    },
    {
      "image": "assets/images/splash_3.png",
      "text": "We show the easy way to shop. \n Just stay at home with us"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]['image'] ?? '',
                  // Sử dụng chuỗi rỗng nếu giá trị là null
                  text: splashData[index]['text'] ??
                      '', // Sử dụng chuỗi rỗng nếu giá trị là null
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionatesScreenWidth(20),
                ),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index),
                      ),
                    ),
                    Spacer(flex: 3),
                     DefaultButton(
                      text: "continue",
                      press: () {},
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}


