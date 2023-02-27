import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:google_fonts/google_fonts.dart";

import "package:pocket_pal/constants/color_const.dart";

import "package:pocket_pal/widgets/pocket_pal_button.dart";
import "package:pocket_pal/widgets/pocket_pal_formfield.dart";


class ForgotPasswordTemplate extends StatelessWidget{
  final void Function(int) changePage;
  final void Function() clearForm;
  final Future<void> Function() authFunction;

  final GlobalKey<FormState> formKey;

  final TextEditingController email;

  final double screenWidth;
  final double screenHeight;


  const ForgotPasswordTemplate({ 
    super.key,
    required this.formKey,
    required this.email,
    required this.changePage,
    required this.screenWidth,
    required this.screenHeight,
    required this.clearForm,
    required this.authFunction
  });

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar : PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.08),
        child : SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children : [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06
                ),
                child: GestureDetector(
                  onTap : (){ 
                    clearForm();
                    changePage(1);
                  },
                  child : Center(
                    child : Icon(
                      Icons.arrow_back_ios_new_rounded, 
                      color : MyColor.black,
                      size : 38
                    )
                  )
                ),
              )
            ]
          ),
        )
      ),

      body : SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key : formKey,
              autovalidateMode: AutovalidateMode.always,
              child: SizedBox(
                width : screenWidth - (screenWidth * 0.16),
                child: Column(
                  children : [
                    Center(
                      child: SvgPicture.asset(
                        "assets/svg/forgot_password.svg",
                        width: screenWidth - (screenWidth * 0.08)
                      )
                    ),
                    
                    SizedBox( height : screenHeight * .04), 
                    
                    RichText(
                      text : TextSpan(
                        children : [
                          TextSpan(
                            text : "Forgot Password?\n",
                            style : TextStyle(
                              color : MyColor.black,
                              fontSize: 34,
                              fontWeight : FontWeight.w600
                            )
                          ),
                          const TextSpan(text : "Enter your email below to receive instructions in retrieving your account" )
                        ],
                        style : GoogleFonts.poppins(
                          color : MyColor.grey,
                          fontSize : 16,
                        )
                      ),
                    ),
                    
                    SizedBox( height : screenHeight * .03 ),
                    PocketPalFormField(
                      formController : email,  
                      formHintText : "Email Address",
                      formValidator: (value){
                        String pattern = r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)";
                        final regExp = RegExp(pattern);
      
                        if (value!.isEmpty) {
                          return "Email Address Field is Empty";
                        } else if (!regExp.hasMatch(value)) {
                          return "Please Enter a Valid Email Address";
                        } else {
                          return null;
                        }
                      },
                    ),
                    
                    SizedBox( height : screenHeight * 0.03),
                    PocketPalButton(
                      buttonHeight: 60, 
                      buttonWidth: screenWidth, 
                      buttonBorderRadius: 10,
                      buttonColor: MyColor.rustic, 
                      buttonOnTap: (){
                        final isValid = formKey.currentState!.validate();
      
                        if (isValid){
                          authFunction();
                          changePage(1);
                        }
                      },
                      buttonChild: Text(
                        "Submit",
                        style : GoogleFonts.poppins(
                          fontSize : 18,
                          fontWeight : FontWeight.w700,
                          color : MyColor.white
                        )
                      ),
                    ),
                    SizedBox( height : screenHeight * 0.04),
                  ]
                ),
              ),
            ),
          ),
        ),
      )
    ); 
  }
}


    