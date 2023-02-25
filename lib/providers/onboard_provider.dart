import "package:flutter/material.dart";


class OnboardProvider with ChangeNotifier{

  final List _onboardItems = [
    [
      "assets/svg/screen_1.svg",
      "Manage finances \nconveniently",
      "Map out and organize your finances \nsmoohtly and easily."
    ],
    [
      "assets/svg/screen_2.svg",
      "Collaborate with \nyour peers",
      "Peer collaboration reinforces brainstorming \nof ideas for budget management."
    ],
    [
      "assets/svg/screen_3.svg",
      "Brainstorm and \nStrategize",
      "Collect ideas and assess financial \nstrategies together.",
    ]
  ];

  int _currentPage = 0;

  List get getOnboardItems => _onboardItems;
  int get getOnboardLength => _onboardItems.length;
  int get getCurrentPage => _currentPage;

  void changePage(int value){
    _currentPage = value;
    notifyListeners();
    return;
  }

}