import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:firebase_core/firebase_core.dart";

import "package:pocket_pal/providers/onboard_provider.dart";
import "package:pocket_pal/providers/theme_manager_provider.dart";
import "package:pocket_pal/providers/auth_provider.dart";

import "package:pocket_pal/constants/dark_theme_const.dart";
import "package:pocket_pal/constants/light_theme_const.dart";

import "package:pocket_pal/screens/Onboard/onboard.dart";


Future<void> main(List<String> arguments) async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers : [
        ChangeNotifierProvider(create: (context) => ThemeManagerProvider()),
        ChangeNotifierProvider(create: (context) => OnboardProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child : const MyApp()
    )
  );

  return;
}


class MyApp extends StatelessWidget {
  const MyApp({ super.key });

  @override 
  Widget build(BuildContext context){

    final theme = context.watch<ThemeManagerProvider>().getTheme;

    return MaterialApp(
      title : "Pocket Pal",
      debugShowCheckedModeBanner: false,

      theme : lightTheme,
      darkTheme: darkTheme,
      themeMode : theme,

      home: const OnboardView(),
    );
  }
}