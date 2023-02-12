// ignore_for_file: must_be_immutable

import 'package:final_project/infrastructure/rating_controller.dart';
import 'package:final_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodRate extends ConsumerWidget {
  String img;
  FoodRate({required this.img});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color theme = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(children: [
          Stack(
            children: [
              Image.asset(
                  "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\images\\Pattern.png",
                  width: double.infinity,
                  fit: BoxFit.fitWidth),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25),
                child: CircleAvatar(
                  minRadius: 95,
                  backgroundImage: AssetImage(img),
                  backgroundColor: MyColors.green,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 45),
            child: Text(
              "Thank You!",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color:
                      theme == MyColors.white ? MyColors.black : MyColors.white,
                  fontSize: 24),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              "Enjoy Your Meal",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color:
                      theme == MyColors.white ? MyColors.black : MyColors.white,
                  fontSize: 24),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text(
              'Please Rate Your Last Food',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: theme == MyColors.white
                      ? MyColors.greyBackground
                      : MyColors.white,
                  fontSize: 13),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 45),
            child: RatingBar(
              initialRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              minRating: 1,
              maxRating: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 5),
              ratingWidget: RatingWidget(
                  full: Image.asset(
                      'D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\FullStar.png'),
                  half: Image.asset(
                      'D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\FullStar.png'),
                  empty: Image.asset(
                      'D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\EmptyStar.png')),
              onRatingUpdate: (value) {
                ref.watch(ratingController).stars = value;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.06,
                left: 25,
                right: 25),
            child: Material(
                borderRadius: BorderRadius.circular(15),
                elevation: 2,
                color: theme == MyColors.white
                    ? MyColors.white.withOpacity(0.85)
                    : MyColors.darkBackground.withOpacity(0.85),
                child: Container(
                  width: double.infinity,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: theme == MyColors.white
                        ? MyColors.white.withOpacity(0.85)
                        : MyColors.darkBackground.withOpacity(0.85),
                  ),
                  child: Container(
                    width: 20,
                    height: 20,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: TextField(
                          controller: ref.watch(ratingController).feedback,
                          minLines: 1,
                          maxLines: 5,
                          style: TextStyle(
                              fontSize: 20,
                              color: theme == MyColors.white
                                  ? MyColors.black
                                  : MyColors.white),
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          cursorHeight: 30,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.edit_note_outlined,
                                  color: MyColors.green),
                              border: InputBorder.none,
                              hintText: "Leave Feedback",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: theme == MyColors.white
                                      ? MyColors.greyBackground
                                      : MyColors.grey,
                                  fontSize: 15))),
                    ),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [MyColors.green, MyColors.darkGreen]),
                      borderRadius: BorderRadius.circular(15)),
                  child: MaterialButton(
                    onPressed: () async {
                      await ref.read(ratingController).ratingFood();
                      Navigator.pop(context);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    minWidth: 220,
                    height: 65,
                    child: Text("Submit",
                        style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: MyColors.white)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: MyColors.darkBackground,
                      borderRadius: BorderRadius.circular(15)),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: MyColors.darkBackground,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    minWidth: 100,
                    height: 65,
                    child: Text("Skip",
                        style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: MyColors.green)),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
