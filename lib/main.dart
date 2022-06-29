import 'package:borauai/class%20and%20components/calc.dart';
import 'package:borauai/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
    create: (context)=> Calckm(),
    child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bora uai',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}