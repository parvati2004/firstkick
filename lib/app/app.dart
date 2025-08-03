
import 'package:firstkick/themes.dart';
import 'package:firstkick/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Memer app",
       theme: ThemeData(
      useMaterial3: true,
      colorScheme:MyThemes.lightScheme(),
        fontFamily: GoogleFonts.dmSans().fontFamily,
    ),
  
       darkTheme: ThemeData(
      useMaterial3: true,
      colorScheme:MyThemes.darkScheme(),
      fontFamily: GoogleFonts.dmSans().fontFamily,
    ),
      home:HomeView()
    );
  }
}