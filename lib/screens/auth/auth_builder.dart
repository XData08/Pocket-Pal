import "package:flutter/material.dart"; 
import "package:firebase_auth/firebase_auth.dart";
import "package:provider/provider.dart";

import "package:pocket_pal/screens/auth/templates/forgot_password_template.dart";
import "package:pocket_pal/screens/auth/templates/signup_template.dart";
import "package:pocket_pal/screens/auth/templates/signin_template.dart";

import "package:pocket_pal/providers/auth_provider.dart";


class AuthViewBuilder extends StatefulWidget {
  const AuthViewBuilder({ super.key });

  @override
  State<AuthViewBuilder> createState() => _AuthViewBuilderState();
}

class _AuthViewBuilderState extends State<AuthViewBuilder> {

  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _confirmPassword;  

  @override
  void initState(){
    super.initState();
    _name = TextEditingController( text : "" );
    _email = TextEditingController( text : "" );
    _password = TextEditingController( text : "" );
    _confirmPassword = TextEditingController( text : "" );
    return;
  }

  @override
  void dispose(){
    super.dispose();
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    return;
  }

  void clearForm(){
    _name.clear();
    _email.clear();
    _password.clear();
    _confirmPassword.clear();
    return;
  }

  Future<void> signUpUser() async {

    final String email = _email.text.trim();
    final String password = _password.text.trim();

    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email, 
      password: password
    );
    return;
  }

  Future<void> signInUser() async {

    final String email = _email.text.trim();
    final String password = _password.text.trim();

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, 
      password: password
    );
    return;
  }

  Future<void> forgotPassword() async {
    final String email = _email.text.trim();

    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: email
    );
    return;
  }

  @override 
  Widget build(BuildContext context){

    final wAuth = context.watch<AuthProvider>();
    final rAuth = context.read<AuthProvider>();

    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    if (wAuth.getCurrentPage == -1){
      // Sign Up Template
      return SignUpTemplate(
        formKey : rAuth.getFormKey,
        name : _name,
        email : _email,
        password : _password,
        confirmPassword : _confirmPassword,
        screenHeight : screenHeight,
        screenWidth : screenWidth,
        changePage : rAuth.changePage,
        authFunction : signUpUser,
        obsecure : wAuth.getIsObsecure,
        changeObsecure : rAuth.changeObsecure,
        clearForm: clearForm,
      );
    } else if (wAuth.getCurrentPage == 1){
      // Sign In Template
      return SignInTemplate(
        formKey : rAuth.getFormKey,
        email : _email,
        password : _password,
        screenHeight : screenHeight,
        screenWidth : screenWidth,
        changePage : rAuth.changePage,
        authFunction : signInUser,
        obsecure : wAuth.getIsObsecure,
        changeObsecure : rAuth.changeObsecure,
        clearForm: clearForm,
      );
    } else {
      // Forgot Password Template
      return ForgotPasswordTemplate(
        formKey : rAuth.getFormKey,
        email : _email,
        screenHeight : screenHeight,
        screenWidth : screenWidth,
        authFunction : forgotPassword,
        changePage : rAuth.changePage,
        clearForm: clearForm,
      ); 
    }
  }
}