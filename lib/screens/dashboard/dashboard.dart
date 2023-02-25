import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";

class DashboardView extends StatelessWidget {
  const DashboardView({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body : Center(
        child : ElevatedButton(
          onPressed: (){
            FirebaseAuth.instance.signOut();
          },
          child : Text("Logout " + FirebaseAuth.instance.currentUser!.email!)
        )
      ),
    );
  }
}