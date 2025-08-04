import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'views/home_view.dart'; // <-- make sure this is correct

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MaterialApp(
    title: "Memer app",
    home: HomeView(), // <-- load your working screen
  ));
}
