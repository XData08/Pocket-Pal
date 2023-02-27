import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:pocket_pal/constants/color_const.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";

import "package:pocket_pal/widgets/pocket_pal_formfield.dart";
import "package:pocket_pal/widgets/pocket_pal_button.dart";

import "package:pocket_pal/screens/auth/widgets/divider_widget.dart";
import "package:pocket_pal/screens/auth/widgets/social_auth_widget.dart";
import "package:pocket_pal/screens/auth/widgets/bottom_navigation_widget.dart";


class SignInTemplate extends StatelessWidget{
  final void Function(int) changePage;
  final Future<void> Function() authFunction;
  final void Function() clearForm;

  final GlobalKey<FormState> formKey;

  final TextEditingController email;
  final TextEditingController password;

  final double screenWidth;
  final double screenHeight;

  final bool obsecure;
  final void Function() ? changeObsecure;

  const SignInTemplate({ 
    super.key,
    required this.formKey,
    required this.email,
    required this.password, 
    required this.changePage,
    required this.screenHeight,
    required this.screenWidth,
    required this.authFunction,
    required this.obsecure,
    required this.changeObsecure,
    required this.clearForm,
  });

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key : formKey,
              child: SizedBox(
                width : screenWidth - (screenWidth * 0.16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children : [
                      
                    SizedBox(height : screenHeight * .04 ),
                    RichText(
                      text : TextSpan(
                        children : [
                          TextSpan(
                            text : "Welcome Back\n",
                            style : TextStyle(
                              color : MyColor.black,
                              fontSize: 34,
                              fontWeight : FontWeight.w600
                            )
                          ),
                          const TextSpan(text : "You've been missed!" )
                        ],
                        style : GoogleFonts.poppins(
                          color : MyColor.grey,
                          fontSize : 16,
                        )
                      ),
                    ),
                  
                    SizedBox( height : screenHeight * 0.06),
                    PocketPalFormField(
                      formController : email,
                      formHintText : "Email Address",
                      formValidator: (value){
                        String pattern = r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)";
                        final regExp = RegExp(pattern);
      
                        if (value!.isEmpty) {
                          return "Email Address Field must not be Empty";
                        } else if (!regExp.hasMatch(value)) {
                          return "Please Enter a Valid Email Address";
                        } else {
                          return null;
                        }
                      },
                    ),
                    
                    SizedBox( height : screenHeight * 0.02 ),
                    PocketPalFormField(
                      formController : password,
                      formHintText : "Password",
                      formIsObsecure: obsecure,
                      formValidator: (value){
                        final fieldLength = value!.length;
                        
                        if (value.isEmpty){
                          return "Password Field must not be Empty";
                        } else if (fieldLength < 7) {
                          return "Password must be at least 7 characters long";
                        } else {
                          return null;
                        }
                      },
                      formSuffixIcon: IconButton(
                        icon : Icon(
                          (obsecure) ? 
                            FeatherIcons.eye : FeatherIcons.eyeOff
                        ), 
                        onPressed: changeObsecure,
                      ),
                    ),
                    
                    SizedBox( height : screenHeight * 0.02 ),
                    Align(
                      alignment : Alignment.centerRight,
                      child: GestureDetector(
                        onTap : () => changePage(0),
                        child: Text(
                          "Forgot Password?",
                          style : GoogleFonts.poppins()
                        ),
                      ),
                    ),
                    
                    SizedBox( height : screenHeight * 0.02 ),
                    PocketPalButton(
                      buttonHeight: 60, 
                      buttonWidth : screenWidth,
                      buttonVerticalMargin: screenHeight * .04,
                      buttonBorderRadius: 10,
                      buttonColor: MyColor.rustic,
                      buttonOnTap: (){
                        final isValid = formKey.currentState!.validate();
      
                        if (isValid){
                          authFunction();
                        }
                      },
                      buttonChild: Text(
                        "Log In",
                        style : GoogleFonts.poppins(
                          fontSize : 18,
                          fontWeight : FontWeight.w600,
                          color : MyColor.white
                        )
                      ),
                    ),
                    
                    SizedBox(height : screenHeight * .12 ),
                    MyDividerWidget(
                      dividerName: "or Login In with",
                      dividerWidth: screenWidth,
                    ),
              
                    SizedBox(height : screenHeight * .04 ),
                    SocialAuthWidget(
                      onTapGoogle: (){},
                      onTapFacebook: (){}, 
                      onTapGithub: (){}
                    ),
                  
                  
                    SizedBox(height : screenHeight * .06 ),
                    MyBottomNavigationWidget(
                      bottomText: "Don't have an Account? ",
                      bottomNavigationText: "Sign Up",
                      bottomOnTap: (){ 
                        clearForm();
                        changePage(-1);
                      }
                    ),
                    SizedBox(height : screenHeight * .04 ),
                    
                    
                  ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}