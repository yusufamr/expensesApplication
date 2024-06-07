import 'package:expenses/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var myColorScheme = ColorScheme.fromSeed(seedColor: Colors.blueAccent);
var myDarkScheme = ColorScheme.fromSeed(seedColor: Colors.blueAccent);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: myColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: myColorScheme.onPrimaryContainer,
            foregroundColor: myColorScheme.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
              color: myColorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: myColorScheme.primaryContainer)),
          textTheme: TextTheme().copyWith(
              titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            color: myColorScheme.onSecondaryContainer,
            fontSize: 14,
          ))),

      darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: myDarkScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: myDarkScheme.onPrimaryContainer,
            foregroundColor: myDarkScheme.primaryContainer,
          ),
          bottomSheetTheme: BottomSheetThemeData().copyWith(
            backgroundColor: myColorScheme.onPrimaryContainer,


          ),
          cardTheme: const CardTheme().copyWith(
              color: myDarkScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: myDarkScheme.primaryContainer,
              foregroundColor: myDarkScheme.onPrimaryContainer)),
          textTheme: TextTheme().copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: myDarkScheme.onSecondaryContainer,
                fontSize: 14,
              ))),
      home: const Expenses(),
    );
  }
}
