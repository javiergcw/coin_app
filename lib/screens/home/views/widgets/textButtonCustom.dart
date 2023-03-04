import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onPressed;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      decoration: BoxDecoration(
        gradient: isSelected
            ? const LinearGradient(
                colors: [UIColors.redQ, UIColors.redW],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: isSelected
            ? [
                const BoxShadow(
                  color: UIColors.redQ,
                  blurRadius: 8,
                  offset: Offset(0, 0),
                ),
              ]
            : null,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          primary: isSelected ? Colors.white : Colors.black,
        ),
        onPressed: onPressed as void Function()?,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );

    /* Container(
      height: 34,
      decoration: BoxDecoration(
        gradient: isSelected
            ? const LinearGradient(
                colors: [UIColors.redQ, UIColors.redW],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          primary: isSelected ? Colors.white : Colors.black,
        ),
        onPressed: onPressed as void Function()?,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    ); */
  }
}
