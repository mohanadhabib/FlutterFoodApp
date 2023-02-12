import 'package:final_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: must_be_immutable
class HorizontalCard extends StatelessWidget {
  String img,firstSt,secondSt,price;
  HorizontalCard({
    required this.img,
    required this.firstSt,
    required this.secondSt,
    required this.price
  });
  @override
  Widget build(BuildContext context) {
    Color theme = Theme.of(context).scaffoldBackgroundColor;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23),
      child: Material(
        borderRadius: BorderRadius.circular(22),
        elevation: 2,
        color:theme == MyColors.white?MyColors.white: MyColors.darkBackground,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(22),
          color: theme == MyColors.white?MyColors.white: MyColors.darkBackground,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(img,width: MediaQuery.of(context).size.width*0.15,height: MediaQuery.of(context).size.height*0.125),
              Padding(
                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(firstSt,
                    style:GoogleFonts.sourceSansPro(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: theme == MyColors.white
                                              ? MyColors.black
                                              : MyColors.white) ,),
                    Text(secondSt,
                    style: GoogleFonts.sourceSansPro(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: MyColors.grey,)),
                  ],
                ),
              ),
              Text(price,
               style: GoogleFonts.sourceSansPro(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.grey,)
              )
            ],
          ),
        ),
      ),
    );
  }
}