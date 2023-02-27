import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:provider/provider.dart";
import "package:firebase_auth/firebase_auth.dart";

import "package:pocket_pal/screens/menu/widgets/logout_button_widget.dart";
import "package:pocket_pal/screens/menu/widgets/profile_widget.dart";
import "package:pocket_pal/widgets/pocket_pal_menu_item.dart";

import "package:pocket_pal/providers/menuscreen_provider.dart";
import "package:pocket_pal/constants/color_const.dart";


class MenuView extends StatefulWidget {
  final PocketPalMenuItem currentItem;
  final ValueChanged<PocketPalMenuItem> onSelectedItem;

  const MenuView({
    super.key,
    required this.currentItem,
    required this.onSelectedItem
    });

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {

    final menuItems = context.read<MenuScreenProvider>().getPocketPalMenuItems;
    
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: MyColor.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.08),
              
              MyProfileWidget(
                profileName: "${FirebaseAuth.instance.currentUser!.email!}", 
                nickname: 'iampaula123'),
            
              SizedBox(
                height: 80,
                child: Divider(
                  color: MyColor.lightGrey,
                  thickness: 0.8,
                ),
              ),
            
              ...menuItems.map(buildMenuItem).toList(),

              const Spacer(),
              GestureDetector(
                onTap : (){
                  FirebaseAuth.instance.signOut();
                },
                child: const MyLogoutButtonWidget()
              ),
              const SizedBox(height: 50,),
            ],
          ),
        ),  
      )
    );
  }

  Widget buildMenuItem(PocketPalMenuItem item) => ListTileTheme(
    child: ListTile(
      leading: Icon(item.icon,
          color: MyColor.white,
          size: 26),
      title: Text(item.title,
        style: GoogleFonts.poppins(
            fontSize: 18,
            color: MyColor.white,
            fontWeight: FontWeight.w600
          ),),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),

      selectedTileColor: MyColor.rustic,
      minLeadingWidth: 35,
      selected: widget.currentItem == item,
      onTap: () => widget.onSelectedItem(item),
    ),
    );
}