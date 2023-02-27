import "package:flutter/material.dart";
import "package:pocket_pal/constants/color_const.dart";
import 'package:pocket_pal/screens/onboard/widgets/pageview_indicator_widget.dart';
import "package:pocket_pal/screens/auth/auth.dart";
import "package:provider/provider.dart";
import "package:google_fonts/google_fonts.dart";

// import "package:pocket_pal/screens/auth/auth.dart";
import "package:pocket_pal/screens/auth/auth.dart";

import "package:pocket_pal/widgets/pocket_pal_button.dart";

import "package:pocket_pal/providers/onboard_provider.dart";

import 'package:pocket_pal/screens/onboard/widgets/pageview_tile_widget.dart';


class OnboardView extends StatefulWidget {
  const OnboardView({ super.key });

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {

  late final PageController _pageController;

  @override
  void initState(){
    super.initState();
    _pageController = PageController();
    return;
  }

  @override
  void dispose(){
    super.dispose();
    _pageController.dispose();
    return;
  }

  @override
  Widget build(BuildContext context){

    final wOnboard = context.watch<OnboardProvider>();
    final rOnboard = context.read<OnboardProvider>();
    
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      body : Stack(
        alignment : Alignment.center,
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: wOnboard.changePage,
            itemCount : rOnboard.getOnboardLength,
            itemBuilder: (context, index){
              return Stack(
                children: [
                  Positioned(
                    width : screenWidth,
                    height : screenHeight-(screenHeight * .1),
                    child: MyPageViewTileWidget(
                      pageViewTileImage: rOnboard.getOnboardItems[index][0], 
                      pageViewTileTitle: rOnboard.getOnboardItems[index][1], 
                      pageViewTileDescription: rOnboard.getOnboardItems[index][2], 
                      screenHeight: screenHeight, 
                      screenWidth: screenWidth
                    ),
                  ),
                ],
              );
            },
          ),

          Positioned(
            top : screenHeight * 0.06,
            right : (screenWidth * .06),
            height : screenHeight,
            child : GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder : (context) => const AuthView()
                  )
                ); 
              },
              child : Text(
                "skip",
                textAlign : TextAlign.left,
                style : GoogleFonts.poppins(
                  color : MyColor.grey,
                  fontSize : 18,
                  fontWeight : FontWeight.w500
                )
              )
            )
          ),
      
          Positioned(
            bottom : 0,
            child: Column(
              children: [
                PocketPalButton(
                  buttonWidth : screenWidth - (screenWidth * .14),
                  buttonHeight : screenHeight * .075,
                  buttonVerticalMargin: screenHeight * .04,
                  buttonHorizontalMargin: 20,
                  buttonColor: (wOnboard.getCurrentPage == 2) ? MyColor.rustic : MyColor.lightGrey,
                  buttonBorderRadius: 10,
                  buttonOnTap: (){
                    if (wOnboard.getCurrentPage == 2){
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder : (context) => const AuthView()
                        )
                      );
                    }

                    _pageController.animateToPage(
                      rOnboard.getCurrentPage + 1, 
                      duration: const Duration( milliseconds: 300 ), 
                      curve: Curves.easeOutCubic
                    );
                  },
                  buttonChild: Text(
                    (wOnboard.getCurrentPage == 2) ? "Get Started!" : "Next",
                    style : GoogleFonts.poppins(
                      color : (wOnboard.getCurrentPage == 2) ? MyColor.white : MyColor.black,
                      fontSize : 18,
                      fontWeight: FontWeight.w600
                    )
                  ),
                ),

                SizedBox(
                  width : 66,
                  height : 12,
                  child: MyPageViewIndicatorWidget(
                    pageViewItemLength: rOnboard.getOnboardLength,
                    pageViewCurrentPage : wOnboard.getCurrentPage,
                  ),
                ),
                SizedBox( height : screenHeight * .04)
              ],
            )
          )
        ],
      )
    );
  }
}