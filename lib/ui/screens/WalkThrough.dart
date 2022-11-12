import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:contentwiz/ui/components/PillButton.dart';

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
          scale: 3,
          height: 400
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
          padding: const EdgeInsets.all(24.0),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(child: SvgPicture.asset("assets/svg/logo.svg")),
                const Expanded(
                  child: WalkThroughCard(
                    cardImage: "assets/img/wthOne.png", 
                    cardCaption: "Manage all your leads on a single platform!"
                  ),
                ),
                PillButton(
                  buttonText: "Continue with Google",
                  onPressed: () {
                    print("pushing named");
                    Navigator.pushNamed(context, "/setup");
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}