import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:google_fonts/google_fonts.dart";

import "package:pocket_pal/constants/color_const.dart";


class MySearchBarWidget extends StatelessWidget {
  const MySearchBarWidget({ super.key });

  @override 
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color : Colors.transparent,
        boxShadow: [
          BoxShadow(
            color : MyColor.black!.withOpacity(.2),
            blurRadius: 4,
            offset: const Offset(0, 2), 

          )
        ]
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical : 20
          ),
          prefixIcon: const Icon(
            FeatherIcons.search
          ),
          filled: true,
          fillColor: MyColor.white,
          hintText: "Search Group | Wall | Envelope",
          hintStyle: GoogleFonts.poppins(
            fontSize : 16,
            fontWeight: FontWeight.w500
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(color: Colors.transparent)
          ),
    
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(color: Colors.transparent)
          )
        ),
      ),
    ); 
  }
}