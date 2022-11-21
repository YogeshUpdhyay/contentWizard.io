import 'package:flutter/material.dart';

const Map<int, Color> themeColors = {
  50:Color.fromRGBO(107,78,255, .1),
  100:Color.fromRGBO(107,78,255, .2),
  200:Color.fromRGBO(107,78,255, .3),
  300:Color.fromRGBO(107,78,255, .4),
  400:Color.fromRGBO(107,78,255, .5),
  500:Color.fromRGBO(107,78,255, .6),
  600:Color.fromRGBO(107,78,255, .7),
  700:Color.fromRGBO(107,78,255, .8),
  800:Color.fromRGBO(107,78,255, .9),
  900:Color.fromRGBO(107,78,255, 1),
};

MaterialColor themeColor = const MaterialColor(0xff6B4EFF, themeColors);


const textTheme = TextTheme(
  // display texts
  displayLarge: TextStyle(
    color: Colors.black,
    fontFamily: 'Inter',
    fontSize: 32,
    fontWeight: FontWeight.w900
  ),
  displayMedium: TextStyle(
    color: Colors.black,
    fontFamily: 'Inter',
    fontSize: 24,
    fontWeight: FontWeight.w900,
  ),
  displaySmall: TextStyle(
    color: Colors.black,
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w900
  ),

  // body texts
  bodyLarge: TextStyle(
    color: Colors.black,
    fontFamily: 'Inter',
    fontSize: 32,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    color: Colors.black
  ),
  bodySmall: TextStyle(
    fontFamily: 'Inter',
    color: Colors.black,
    fontSize: 12
  ),

  // title texts
  titleMedium: TextStyle(
    color: Colors.black,
    fontFamily: 'Inter',
    fontSize: 16,
  )
);
