import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PillButton extends StatelessWidget {

  const PillButton({
    super.key, 
    required this.onPressed, 
    required this.text,
    this.color, 
    this.logo, 
    this.textColor
  });

  final String text;
  final VoidCallback onPressed;
  final String? logo;
  final Color? color;
  final Color? textColor;

  Widget getButtonContent(BuildContext context) {
    if (logo == null) {
      return Center(
        child: Text(
          text, 
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: textColor ?? Colors.white
          )
        )
      );
    }
    return Row(
      children: [
        SvgPicture.asset(logo!),
        Expanded(
          child: Center(
            child: Text(
              text, 
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: textColor ?? Colors.white
              )
            )
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).colorScheme.primary,
        fixedSize: const Size.fromHeight(48.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0)
        )
      ),
      child: getButtonContent(context),
    );
  }
}