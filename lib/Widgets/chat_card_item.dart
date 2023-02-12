import 'package:final_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ChatCard extends ConsumerWidget{
  String img,firstSt,secondSt,thirdSt;
  ChatCard({
    required this.img,
    required this.firstSt,
    required this.secondSt,
    required this.thirdSt
});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    Color theme = Theme.of(context).scaffoldBackgroundColor;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23),
      child: Material(
        borderRadius: BorderRadius.circular(22),
        elevation: 2,
        color:
            theme == MyColors.white ? MyColors.white : MyColors.darkBackground,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: theme == MyColors.white
                ? MyColors.white
                : MyColors.darkBackground,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10,bottom: 10),
                width: MediaQuery.of(context).size.width * 0.175,
                height: MediaQuery.of(context).size.height * 0.09,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(img),fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(22)),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      firstSt,
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: theme == MyColors.white
                              ? MyColors.black
                              : MyColors.white),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 8),
                      child: Text(secondSt,
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: theme == MyColors.white
                                ? MyColors.greyBackground
                                : MyColors.grey,
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(thirdSt,
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: theme == MyColors.white
                              ? MyColors.greyBackground
                              : MyColors.grey,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
