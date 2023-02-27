import "package:flutter/material.dart";
import "package:pocket_pal/widgets/pocket_pal_menu_button.dart";


class ProfileView extends StatelessWidget {
  const ProfileView({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: const PocketPalMenuButton(),
        title: const Text("Profile")
      ),
    );
  }
}