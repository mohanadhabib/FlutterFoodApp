// ignore_for_file: must_be_immutable

import 'package:final_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifiedChatCard extends ConsumerWidget {
  String img, name;
  void Function()? onTap;
  ModifiedChatCard({required this.img, required this.name, this.onTap});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color theme = Theme.of(context).scaffoldBackgroundColor;
    return Padding(
      padding: EdgeInsets.only(right: 25),
      child: Material(
        borderRadius: BorderRadius.circular(22),
        elevation: 2,
        color: theme == MyColors.white
            ? MyColors.white.withOpacity(0.85)
            : MyColors.darkBackground.withOpacity(0.85),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: theme == MyColors.white
                ? MyColors.white.withOpacity(0.85)
                : MyColors.darkBackground.withOpacity(0.85),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                width: MediaQuery.of(context).size.width * 0.175,
                height: MediaQuery.of(context).size.height * 0.09,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(img), fit: BoxFit.cover),
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
                      name,
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: theme == MyColors.white
                              ? MyColors.black
                              : MyColors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text("Online",
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
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: onTap,
                      child: theme == MyColors.white
                          ? Image.asset(
                              "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\CallLogoLight.png")
                          : Image.asset(
                              "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\CallLogoDark.png"),
                    )
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
