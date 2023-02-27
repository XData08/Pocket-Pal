import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:flutter_zoom_drawer/flutter_zoom_drawer.dart";

class PocketPalMenuButton extends StatefulWidget {
  const PocketPalMenuButton({super.key});

  @override
  State<PocketPalMenuButton> createState() => _PocketPalMenuButtonState();
}

class _PocketPalMenuButtonState extends State<PocketPalMenuButton> {
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ZoomDrawer.of(context)!.toggle();
      },
      icon: const Icon(FeatherIcons.menu),
    );
  }
}