import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NavItem extends StatelessWidget {
  NavItem({required bool this.isSelected, required String this.icon, required String this.text});
  bool? isSelected;
  String icon, text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: isSelected == true ? [Image.asset(icon,width: 25,height: 25) , Text(text)] : [Image.asset(icon,width: 25,height: 25)],
    );
  }
}
