import 'package:final_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MyCard extends StatelessWidget {
  String img,firstSt,secondSt;
  MyCard({
    required this.img,
    required this.firstSt,
    required this.secondSt
  });
  @override
  Widget build(BuildContext context) {
    Color theme = Theme.of(context).scaffoldBackgroundColor;
    return Material(
      borderRadius: BorderRadius.circular(22),
      elevation: 2,
      color:theme == MyColors.white?MyColors.white: MyColors.darkBackground,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(22),
        color: theme == MyColors.white?MyColors.white: MyColors.darkBackground,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*0.035,horizontal: 30),
              child: Image.asset(img,width: MediaQuery.of(context).size.width*0.23,height: MediaQuery.of(context).size.height*0.10),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(firstSt,
              style:GoogleFonts.sourceSansPro(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: theme == MyColors.white
                                        ? MyColors.black
                                        : MyColors.white) ,),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(secondSt,
              style: GoogleFonts.sourceSansPro(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: MyColors.grey,)),
            ),
          ],
        ),
      ),
    );
  }
}
