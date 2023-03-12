import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";

import "package:pocket_pal/screens/dashboard/dashboard.dart";
import "package:pocket_pal/screens/profile/profile.dart";
import "package:pocket_pal/screens/settings/settings.dart";

import "package:pocket_pal/widgets/pocket_pal_menu_item.dart"; 

class MenuScreenProvider with ChangeNotifier {

  PocketPalMenuItem _currentPage = const PocketPalMenuItem(
      "Home", 
      FeatherIcons.home,
      DashboardView()
    );
  
  final List<PocketPalMenuItem> _pocketPalMenuItems = const [
    PocketPalMenuItem(
      "Home", 
      FeatherIcons.home,
      DashboardView()
    ),

    PocketPalMenuItem(
      "Profile", 
      FeatherIcons.user,
      ProfileView(),
    ),

    PocketPalMenuItem(
      "Settings",
      FeatherIcons.settings,
      SettingsView()
    ),
  ];

  List <PocketPalMenuItem> get getPocketPalMenuItems => _pocketPalMenuItems;

  PocketPalMenuItem get getCurrentPage => _currentPage;

  set setCurrentPage(PocketPalMenuItem value) {
    _currentPage = value;
    notifyListeners();
  }
}