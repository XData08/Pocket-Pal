import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";

import "package:pocket_pal/widgets/pocket_pal_menu_button.dart";


class DashboardView extends StatelessWidget {
  const DashboardView({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: const PocketPalMenuButton(),
        title: const Text("Dashboard")
      ),
     
    );
  }
}


