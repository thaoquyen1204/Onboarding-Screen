import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';
class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key, required this.text, required this.press,
  }):super(key:key);
  final String text;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionatesScreenWidth(56),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionatesScreenWidth(15),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}