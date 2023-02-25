import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

import "package:pocket_pal/constants/color_const.dart";

import "package:pocket_pal/widgets/pocket_pal_button.dart";


class SocialAuthWidget extends StatelessWidget {

  final void Function() ? onTapGoogle;
  final void Function() ? onTapFacebook;
  final void Function() ? onTapGithub;

  const SocialAuthWidget({ 
    super.key,
    required this.onTapGoogle,
    required this.onTapFacebook,
    required this.onTapGithub
  });

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children : [
        PocketPalButton(
          buttonBorderRadius: 100,
          buttonHeight: 60, 
          buttonWidth: 60, 
          buttonColor: MyColor.white, 
          buttonOnTap: onTapGoogle,
          buttonBoxShadow: [
            BoxShadow(
              blurRadius: 5,
              color : Colors.black.withOpacity(.2)
            ) 
          ],
          buttonChild: SvgPicture.asset(
            "assets/icon/Google.svg",
          ),
        ),
      
        const SizedBox( width : 20 ),
        PocketPalButton(
          buttonBorderRadius: 100,
          buttonHeight: 60, 
          buttonWidth: 60, 
          buttonColor: MyColor.white, 
          buttonOnTap: onTapFacebook,
          buttonBoxShadow: [
            BoxShadow(
              blurRadius: 5,
              color : Colors.black.withOpacity(.2)
            ) 
          ],
          buttonChild: SvgPicture.asset(
            "assets/icon/Facebook.svg",
          ),
        ),

        const SizedBox( width : 20 ),
        PocketPalButton(
          buttonBorderRadius: 100,
          buttonHeight: 60, 
          buttonWidth: 60, 
          buttonColor: MyColor.white, 
          buttonOnTap: onTapGithub,
          buttonBoxShadow: [
            BoxShadow(
              blurRadius: 5,
              color : Colors.black.withOpacity(.2)
            ) 
          ],
          buttonChild: SvgPicture.asset(
            "assets/icon/Github.svg",
          ),
        ),
        
      ]
    );
  }
}