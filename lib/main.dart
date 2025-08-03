

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
 WidgetsFlutterBinding.ensureInitialized();
 SystemChrome.setPreferredOrientations([
   DeviceOrientation.portraitUp,
   DeviceOrientation.portraitDown]);
  runApp(MaterialApp(
    title:"Memer app",
   
    home:Container(
      
    ),
  ));
}

