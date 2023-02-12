import 'package:final_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class FilterCard extends ConsumerWidget {
  String text;
  FilterCard({required this.text});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color theme = Theme.of(context).scaffoldBackgroundColor;
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
      },
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color:
            theme == MyColors.white ? MyColors.orange : MyColors.darkBackground,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: theme == MyColors.white ? MyColors.orange : MyColors.darkBackground),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text(text,
                style: GoogleFonts.sourceSansPro(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: theme == MyColors.white
                        ? MyColors.orangeText
                        : MyColors.grey)),
          ),
        ),
      ),
    );
  }
}
