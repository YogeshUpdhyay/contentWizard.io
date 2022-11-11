import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PillButton extends StatelessWidget {

  const PillButton({super.key, required this.buttonText, required this.onPressed, this.buttonLogo});

  final String buttonText;
  final VoidCallback onPressed;
  final String? buttonLogo;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        alignment: Alignment.center,
        backgroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(50), right: Radius.circular(50)),
            side: BorderSide(color: Colors.black)
          )
        ),
        padding: const MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.all(20))
      ),
      child: Row(
        children: [
          SvgPicture.asset("assets/svg/googleLogo.svg"),
          Expanded(child: Center(child: Text(buttonText, style: Theme.of(context).textTheme.bodyMedium))),
        ],
      ),
    );
  }
}