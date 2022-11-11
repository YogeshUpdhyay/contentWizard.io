import 'package:contentwiz/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
        primarySwatch: Colors.purple,
        fontFamily: "Inter",
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )
        )
      ),
      home: const WalkThrough(),
      routes:  {
        "/walkthrough":(context) => const WalkThrough()
      },
    );
  }
}

class PillButton extends StatelessWidget {

  const PillButton({super.key, required this.buttonText, this.buttonLogo});

  final String buttonText;
  final String? buttonLogo;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => print("hello world"),
      style: ButtonStyle(
        alignment: Alignment.center,
        backgroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(50), right: Radius.circular(50)),
            side: BorderSide(color: Colors.black)
          )
        ),
        padding: const MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.all(16))
      ),
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Text(buttonText, style: Theme.of(context).textTheme.bodyMedium)
          ],
        )

      ),
    );
  }
}

class WalkThroughCard extends HookConsumerWidget {
  const WalkThroughCard({
    super.key,
    required this.cardImage,
    required this.cardCaption
  });
  
  final String cardImage;
  final String cardCaption;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Column(
      children: <Widget>[
        Image.asset(
          cardImage,
          height: 400,
          width: 400,
        ),
        Text(
          cardCaption,
          style: Theme.of(context).textTheme.displayMedium,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

class WalkThrough extends HookConsumerWidget {
  const WalkThrough({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(child: SvgPicture.asset("assets/svg/logo.svg")),
              const WalkThroughCard(
                cardImage: "assets/img/wthOne.png", 
                cardCaption: "Manage all your leads on a single platform!"
              ),
              const Positioned(
                bottom: 0,
                child: PillButton(
                  buttonText: "Continue with Google"
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
