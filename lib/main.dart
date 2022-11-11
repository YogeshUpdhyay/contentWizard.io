import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:contentwiz/ui/screens/WalkThrough.dart';
import 'package:contentwiz/theme/theme.dart';

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
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold
          )
        )
      ),
      home: const WalkThrough(),
      routes:  {
        "/walkthrough":(context) => const WalkThrough(),
        "/setup": (context) => const Setup()
      },
    );
  }
}

class Setup extends HookConsumerWidget {
  const Setup({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Create a Workspace",
              style: Theme.of(context).textTheme.displayLarge,
            )
          ],
        ),
      ),
    );
  }
}