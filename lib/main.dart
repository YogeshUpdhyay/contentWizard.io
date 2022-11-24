import 'package:contentwiz/theme/theme.dart';
import 'package:contentwiz/ui/screens/account.dart';
import 'package:contentwiz/ui/screens/notifications.dart';
import 'package:contentwiz/ui/screens/setup.dart';
import 'package:contentwiz/ui/screens/walkthrough.dart';
import 'package:contentwiz/ui/screens/home.dart';
import 'package:contentwiz/ui/screens/inbox.dart';
import 'package:heroicons/heroicons.dart';
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
        "/setup": (context) =>  const Setup(),
        "/dashboard": (context) => const Dashboard()
      },
    );
  }
}

final currentIndexProvider = StateProvider<int>((ref) => 0);

class Dashboard extends HookConsumerWidget {
  const Dashboard({super.key});

  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const tabs = <Widget>[Home(), Inbox(), Notifications(), Account()];
    final int currentIndex = ref.watch(currentIndexProvider);

    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: const Color(0xff979C9E),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.chatBubbleLeftRight),
            label: 'chat'
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.bellAlert,),
            label: 'chat'
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.user),
            label: 'account'
          )
        ],
        currentIndex: currentIndex,
        onTap: (value) => ref.read(currentIndexProvider.notifier).state = value,
      ),
    );
  }
}




 