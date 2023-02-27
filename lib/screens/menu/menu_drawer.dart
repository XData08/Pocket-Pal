import "package:flutter/material.dart";
import "package:flutter_zoom_drawer/flutter_zoom_drawer.dart";
import "package:provider/provider.dart";

import "package:pocket_pal/screens/menu/menu.dart";

import "package:pocket_pal/providers/menuscreen_provider.dart";
import "package:pocket_pal/widgets/pocket_pal_menu_item.dart";

import "package:pocket_pal/constants/color_const.dart";


class MenuDrawerView extends StatelessWidget {
  const MenuDrawerView({super.key});

  @override
  Widget build(BuildContext context) {

    final rMenuItems = context.read<MenuScreenProvider>();
    final wMenuItems = context.watch<MenuScreenProvider>();

    final width = MediaQuery.of(context).size.width;

    return ZoomDrawer(
      menuBackgroundColor: MyColor.black!,
      borderRadius: 30,

      angle: 0.0,
      showShadow: true,

      mainScreenTapClose: true,
      menuScreenTapClose: true,

      mainScreen: getScreen(rMenuItems.getPocketPalMenuItems, wMenuItems.getCurrentPage),
      menuScreen:  Builder(
          builder: (context) => MenuView(
              currentItem: wMenuItems.getCurrentPage,
              onSelectedItem: (item) {
                rMenuItems.setCurrentPage = item;
                ZoomDrawer.of(context)!.close();
            }),
        ),

      slideWidth: width * 0.75,
      menuScreenWidth: width * 0.7,
      mainScreenScale: 0.2,
    );
  }

  Widget getScreen(List <PocketPalMenuItem> menuItems, PocketPalMenuItem currentItem) {
    if (currentItem == menuItems[0]){
      return menuItems[0].getPageView;
    } else if (currentItem == menuItems[1]){
      return menuItems[1].getPageView;
    } else if (currentItem == menuItems[2]){
      return menuItems[2].getPageView;
    } else {
      return menuItems[0].getPageView;
    }
  }
}