import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:spintech/screen/widget.dart';
import 'package:spintech/utils/contants/image_constants.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late PageController pageController;
  int currentIndex = 0;
  Timer? timer;

  List<Map<String, dynamic>> onBoardingData = [
    {
      'img': AppImage.man1,
      'title': 'Your style tell about you',
      'description': 'There are many clothes with designs that are suitable for you today'
    },
    {
      'img': AppImage.man2,
      'title': 'Level up your lifestyle',
      'description': 'There are many clothes with designs that are suitable for you today'
    },
  ];

  nextFunction() {
    if(currentIndex == 0) {
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
    if(currentIndex == 1) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  onChangeFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SlidingUpPanel(
        parallaxEnabled: true,
        minHeight: size.height * 0.12,
        maxHeight: size.height * 0.12,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
        panelBuilder: (sc) => buildPanelAction(sc, size),
        body: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              onPageChanged: onChangeFunction,
              itemCount: onBoardingData.length,
              itemBuilder: (context, index) {
                return buildBody(
                  onBoardingData[index]['img'],
                  onBoardingData[index]['title'],
                  onBoardingData[index]['description'],
                  index
                );
              }
            )
          ],
        ),
      ),
    );
  }

  buildBody(String img, String title, String description, int index) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.38,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(title,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 32),
          ),
          const SizedBox(height: 5),
          Text(description,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
        ],
      ),
    );
  }

  buildPanelAction(ScrollController sc, Size size) {
    return MediaQuery.removePadding(
      context: context,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xff061023),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32))
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      onBoardingData.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Indicator(
                          isActive: currentIndex == index,
                        ),
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: () => nextFunction(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      child: const Row(
                        children: [
                          Text('continue'),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}