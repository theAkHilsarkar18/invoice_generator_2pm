import 'package:flutter/material.dart';
import 'package:invoice_generator_2pm/screens/addscreen.dart';
import 'package:invoice_generator_2pm/screens/homescreen.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      routes: {
        '/' : (context) =>  HomeScreen(),
        'add' : (context) =>  AddScreen(),
      },
    ),
  );
}