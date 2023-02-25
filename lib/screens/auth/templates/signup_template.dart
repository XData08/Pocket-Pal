import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "package:pocket_pal/constants/color_const.dart";

import "package:pocket_pal/screens/auth/widgets/password_bottom_sheet_widget.dart";

import "package:pocket_pal/widgets/pocket_pal_formfield.dart";
import "package:pocket_pal/widgets/pocket_pal_button.dart";

import "package:pocket_pal/screens/auth/widgets/divider_widget.dart";
import "package:pocket_pal/screens/auth/widgets/social_auth_widget.dart";
import "package:pocket_pal/screens/auth/widgets/bottom_navigation_widget.dart";


class SignUpTemplate extends StatelessWidget{
  final void Function(int) changePage;
  final Future<void> Function() authFunction;
  final void Function() clearForm;

  final GlobalKey<FormState> formKey;

  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController confirmPassword;

  final double screenWidth;
  final double screenHeight;

  final bool obsecure;
  final void Function() ? changeObsecure;

  const SignUpTemplate({ 
    super.key,
    required this.formKey,
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.changePage,
    required this.screenWidth,
    required this.screenHeight,
    required this.authFunction,
    required this.obsecure,
    required this.changeObsecure,
    required this.clearForm, 
  });

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
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
                          text : "Create Account\n",
                          style : TextStyle(
                            color : MyColor.black,
                            fontSize: 34,
                            fontWeight : FontWeight.w600
                          )
                        ),
                        const TextSpan(text : "Sign up to get started!" )
                      ],
                      style : GoogleFonts.poppins(
                        color : MyColor.grey,
                        fontSize : 16,
                      )
                    ),
                  ),
                
                  SizedBox( height : screenHeight * 0.06),
                  PocketPalFormField(
                    formController : name,
                    formHintText : "Full Name",
                    formValidator: (value){
                      if (value!.isEmpty){
                        return "Name Field must not be Empty";
                      } else {
                        return null;
                      }
                    },
                  ),

                  SizedBox( height : screenHeight * 0.02),
                  PocketPalFormField(
                    formController : email,
                    formHintText : "Email Address",
                    formValidator: (value) {
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
                    formIsReadOnly: true,
                    formIsObsecure: true,
                    formValidator: (value) {
                      if (value!.isEmpty){
                        return "Password Field must not be Empty";
                      } else if (value != confirmPassword.text){
                        return "Password does not Match with the confirm password";
                      } else {
                        return null;
                      }
                    },
                    formOnTap: (){

                      showModalBottomSheet(
                        isScrollControlled: true ,
                        context: context, 
                        builder: (context){
                          return MyPasswordBottomSheet(
                            formKey: formKey,
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                            bottomSheetController: password,
                            bottomSheetHintText: "Password",
                          );
                        }
                      );
                      
                    },
                  ),
                  
                  SizedBox( height : screenHeight * 0.02 ),
                  PocketPalFormField(
                    formController : confirmPassword,
                    formHintText : "Confirm Password",
                    formIsObsecure: true,
                    formIsReadOnly: true,
                    formValidator: (value) {
                      if (value!.isEmpty){
                        return "Confirm Password Field must not be Empty";
                      } else if (value != password.text){
                        return "Confirm Password does not Match with the password";
                      } else {
                        return null;
                      }
                    },
                    formOnTap: (){
                      
                      showModalBottomSheet(
                        isScrollControlled: true ,
                        context: context, 
                        builder: (context){
                          return MyPasswordBottomSheet(
                            formKey: formKey,
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                            bottomSheetController: confirmPassword,
                            bottomSheetHintText: "Confirm Password",
                          );
                        }
                      );

                    },
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
                        //  authFunction();
                      }
                    },
                    buttonChild: Text(
                      "Sign Up",
                      style : GoogleFonts.poppins(
                        fontSize : 18,
                        fontWeight : FontWeight.w600,
                        color : MyColor.white
                      )
                    ),
                  ),
                  
                  SizedBox(height : screenHeight * .02 ),
                  MyDividerWidget(
                    dividerName: "or Sign Up with",
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
                    bottomText: "Already have an Account? ",
                    bottomNavigationText: "Sign In",
                    bottomOnTap: (){
                      clearForm();
                      changePage(1);
                    },
                  ),
                  SizedBox(height : screenHeight * .04 ),
                  
                  
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}