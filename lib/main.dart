

import 'package:flutter/material.dart';
import 'package:movieuitest/provider/search_service.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation.dart';


void main() {
  runApp( MultiProvider(providers: [
       ChangeNotifierProvider(
      create: ((context) => SearchServiceModel())

    ),],
  child:   const  MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp

  ({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
  debugShowCheckedModeBanner: false,

      home: BottomNavigation(),

    );
  }
}
