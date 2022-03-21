import 'package:flutter/material.dart';
//import 'loginregister_page.dart';
//import 'homepage.dart';
import 'mapping.dart';
import 'authentication.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(PlantApp());
}

class PlantApp extends StatelessWidget 
{
  const PlantApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Care',
      theme: ThemeData
      (
        primarySwatch: Colors.green,
      ),
      home: MappingPage(auth: Auth(),),
    );
  }
}


