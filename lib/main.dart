import 'package:contentwiz/theme/theme.dart';
import 'package:contentwiz/ui/screens/Setup.dart';
import 'package:contentwiz/ui/screens/WalkThrough.dart';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    )
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Content Wizard',
      theme: ThemeData(
        primarySwatch: themeColor,
        fontFamily: "Inter",
        textTheme: textTheme
      ),
      home: const WalkThrough(),
      routes:  {
        "/walkthrough":(context) => const WalkThrough(),
        "/setup": (context) =>  const Setup()
      },
    );
  }
}




 