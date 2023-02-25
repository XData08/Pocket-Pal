import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:pocket_pal/constants/color_const.dart"; 


class MyBottomNavigationWidget extends StatelessWidget {

  final String bottomText;
  final String bottomNavigationText;
  final void Function() ? bottomOnTap;

  const MyBottomNavigationWidget({ 
    super.key,
    required this.bottomText,
    required this.bottomNavigationText,
    required this.bottomOnTap
  });

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children : [
        Text(
          bottomText,
          style : GoogleFonts.poppins()
        ),

        GestureDetector(
          onTap : bottomOnTap,
          child : Text(
            bottomNavigationText,
            style : GoogleFonts.poppins(
              color : MyColor.rustic,
              fontWeight : FontWeight.bold
            )
          )
        )
      ]
    );
  }
}