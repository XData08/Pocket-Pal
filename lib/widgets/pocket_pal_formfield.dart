import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:pocket_pal/constants/color_const.dart";


class PocketPalFormField extends StatelessWidget {

  final TextEditingController formController;
  final String formHintText;
  
  final bool formIsObsecure;
  final bool formIsReadOnly;

  final Widget ? formSuffixIcon;
  final String ? Function(String?) ? formValidator;
  final void Function() ? formOnTap;
  final void Function(String) ? formOnChange;

  const PocketPalFormField({
    super.key,
    required this.formController,
    required this.formHintText,
    this.formIsObsecure = false,
    this.formIsReadOnly = false,  
    this.formSuffixIcon,
    this.formValidator,
    this.formOnTap,
    this.formOnChange
  });

  @override
  Widget build(BuildContext context){
    return TextFormField(
      controller : formController,
      obscureText: formIsObsecure,
      readOnly: formIsReadOnly,
      onTap: formOnTap,
      onChanged: formOnChange,

      decoration: InputDecoration(
        hintText: formHintText, 
  
        hintStyle: GoogleFonts.poppins(
          fontSize : 16,
          color : MyColor.grey
        ),

        suffixIcon: formSuffixIcon,
        
      ),

      validator: formValidator,
    );
  }
}