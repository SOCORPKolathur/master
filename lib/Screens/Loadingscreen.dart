

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:master/Screens/login.dart';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    double _width =MediaQuery.of(context).size.width;
    double _height =MediaQuery.of(context).size.height;
    return Scaffold(
      body:OnBoard(
        onBoardData: onBoardData,

        pageController: pageController,
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        onSkip: () {
          print('skipped');
        },
        // Either Provide onDone Callback or nextButton Widget to handle done state
        onDone: () {
          print('done tapped');
        },
        titleStyles: GoogleFonts.openSans(
            fontSize:_width/15.1046 ,
            fontWeight: FontWeight.bold
        ),
        descriptionStyles: GoogleFonts.openSans(
            fontSize: _width/28.051428,
            fontWeight: FontWeight.w400
        ),

        pageIndicatorStyle:  PageIndicatorStyle(
          width: _width/3.9272,
          inactiveColor: Color(0xffC5CEE0),
          activeColor: Color(0xff222B45),
          inactiveSize: Size(8, 8),
          activeSize: Size(15, 12),
        ),

        nextButton: OnBoardConsumer(
          builder: (context, ref, child) {
            final state = ref.watch(onBoardStateProvider);
            return InkWell(
              onTap: () => _onNextTap(state),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login()));
                },
                child: Container(
                  width: _width/2.618133,
                  height: _height/15.6654,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xffFADA5E)
                  ),
                  child: Text(
                    state.isLastPage ? "Done" : "Next",
                    style:  TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: _width/21.8177
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),






    );
  }
  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      //print("nextButton pressed");
    }
  }
}
final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: 'Watch Videos to Learn',
    description: 'We have amazing videos that can help you \nunderstanding the concepts much easily',
     imgUrl: "assets/learnman.svg"
  ),
  const OnBoardModel(
    title: "Track your progress with statistics",
    description:
    "Analyse personal result with detailed chart and numerical values",
    imgUrl: "assets/learnman.svg"
  ),
  const OnBoardModel(
    title: "Create photo comparision and share your results",
    description:
    "Take before and after photos to visualize progress and get the shape that you dream about",
    imgUrl: "assets/learnman.svg",
  ),
];
