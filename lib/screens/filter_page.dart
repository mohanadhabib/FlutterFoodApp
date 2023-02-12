import 'package:final_project/Widgets/card_filter.dart';
import 'package:final_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color theme = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Image.asset(
                    "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\images\\PatternProcess.png",
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.8,
                        top: MediaQuery.of(context).size.height * 0.08),
                    child: Material(
                        color: theme == MyColors.white
                            ? MyColors.white
                            : MyColors.darkGreyBackground,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              color: theme == MyColors.white
                                  ? MyColors.white
                                  : MyColors.darkGreyBackground,
                              borderRadius: BorderRadius.circular(15)),
                          child: Image.asset(
                              "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\IconNotifiaction.png"),
                        ))),
                Padding(
                  padding: EdgeInsets.only(
                      left: 25,
                      top: MediaQuery.of(context).size.height * 0.075),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Find Your",
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 33,
                            fontWeight: FontWeight.w700,
                            color: theme == MyColors.white
                                ? MyColors.black
                                : MyColors.white),
                      ),
                      Text(
                        "Favorite Food",
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 33,
                            fontWeight: FontWeight.w700,
                            color: theme == MyColors.white
                                ? MyColors.black
                                : MyColors.white),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  color: theme == MyColors.white
                      ? MyColors.orange
                      : MyColors.darkBackground,
                  child: Container(
                    decoration: BoxDecoration(
                        color: theme == MyColors.white
                            ? MyColors.orange
                            : MyColors.darkBackground,
                        border: Border.all(
                            color: theme == MyColors.white
                                ? MyColors.orange
                                : MyColors.darkBackground,
                            width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                      child: TextField(
                        cursorColor: theme == MyColors.white
                            ? MyColors.orangeText
                            : MyColors.grey,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: MyColors.grey),
                        decoration: InputDecoration(
                            prefixIcon: theme == MyColors.white
                                ? Image.asset(
                                    "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\IconSearch.png")
                                : Image.asset(
                                    "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\IconSearchDark.png"),
                            hintText: "What do you want to order?",
                            hintStyle: GoogleFonts.sourceSansPro(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: theme == MyColors.white
                                    ? MyColors.orangeText
                                    : MyColors.grey),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Text("Type",
              style: GoogleFonts.sourceSansPro(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: theme == MyColors.white
                      ? MyColors.black
                      : MyColors.white)),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FilterCard(text: "Restaurant"),
            ),
            FilterCard(text: "Menu")
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Text("Location",
              style: GoogleFonts.sourceSansPro(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: theme == MyColors.white
                      ? MyColors.black
                      : MyColors.white)),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 5),
              child: FilterCard(text: "1 Km"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: FilterCard(text: ">10 Km"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: FilterCard(text: "<10 Km"),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Text("Food",
              style: GoogleFonts.sourceSansPro(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: theme == MyColors.white
                      ? MyColors.black
                      : MyColors.white)),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 5),
              child: FilterCard(text: "Cake"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: FilterCard(text: "Soup"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: FilterCard(text: "Main Course"),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, right: 5),
                child: FilterCard(text: "Appetizer"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: FilterCard(text: "Dessert"),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: MediaQuery.of(context).size.height * 0.120),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [MyColors.green, MyColors.darkGreen]),
                borderRadius: BorderRadius.circular(15)),
            child: MaterialButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              minWidth: MediaQuery.of(context).size.width * 0.9,
              height: 57,
              child: Text("Search",
                  style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: MyColors.white)),
            ),
          ),
        ),
      ],
    ));
  }
}
