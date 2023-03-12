import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:firebase_core/firebase_core.dart";

import "package:pocket_pal/providers/settings_provider.dart";
import "package:pocket_pal/providers/dashboard_provider.dart";
import "package:pocket_pal/providers/onboard_provider.dart";
import "package:pocket_pal/providers/theme_manager_provider.dart";
import "package:pocket_pal/providers/auth_provider.dart";
import "package:pocket_pal/providers/menuscreen_provider.dart";

import "package:pocket_pal/constants/dark_theme_const.dart";
import "package:pocket_pal/constants/light_theme_const.dart";

import "package:pocket_pal/screens/onboard/onboard.dart";
import "package:pocket_pal/screens/auth/auth.dart";


Future<void> main(List<String> arguments) async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers : [

        ChangeNotifierProvider(
          create: (context) => ThemeManagerProvider()
        ),

        ChangeNotifierProvider(
          create: (context) => OnboardProvider()
        ),
        
        ChangeNotifierProvider(
          create: (context) => AuthProvider()
        ),

        ChangeNotifierProvider(
          create: (context) => MenuScreenProvider()
        ),

        ChangeNotifierProvider(
          create: (context) => PersonalFolderProvider()
        ),

        ChangeNotifierProvider(
          create: (context) => GroupFolderProvider()
        ),

        ChangeNotifierProvider(
          create: (context) => SettingsProvider()
        ),

      ],
      child : const PocketPalApp()
    )
  );

  return;
}


class PocketPalApp extends StatelessWidget {
  const PocketPalApp({ super.key });

  @override 
  Widget build(BuildContext context){

    final theme = context.watch<ThemeManagerProvider>().getTheme;
    final wSettings = context.watch<SettingsProvider>();
    final rSettings = context.read<SettingsProvider>();

    final showOnboard = wSettings.getFirstInstall;

    if (showOnboard){
      rSettings.setDefault();
    }

    return MaterialApp(
      title : "Pocket Pal",
      debugShowCheckedModeBanner: false,

      theme : lightTheme,
      darkTheme: darkTheme,
      themeMode : theme,

      home: (showOnboard) ? 
        const OnboardView() : const AuthView(),
    );
  }
}   


