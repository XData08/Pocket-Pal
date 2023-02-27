import "package:flutter/material.dart";

class PocketPalMenuItem {
  final String title;
  final IconData icon;
  final dynamic pageView;

  const PocketPalMenuItem(
    this.title, 
    this.icon,
    this.pageView
  );

  get getPageView => pageView;
}
