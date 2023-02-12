import 'package:final_project/screens/sign_up.dart';
import 'package:final_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color theme = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15, left: 5),
                child: theme == MyColors.white
                    ? Image.asset(
                        "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\images\\Illustrationone.png")
                    : Image.asset(
                        "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\images\\Illustrationonedark.png")),
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text("Food Ninja is Where Your",
                  style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: theme == MyColors.white
                          ? MyColors.black
                          : MyColors.white)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2),
              child: Text("Comfort Food Lives",
                  style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: theme == MyColors.white
                          ? MyColors.black
                          : MyColors.white)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text("Enjoy a fast and smooth food delivery at",
                  style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: theme == MyColors.white
                          ? MyColors.black
                          : MyColors.white)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text("your doorstep",
                  style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: theme == MyColors.white
                          ? MyColors.black
                          : MyColors.white)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 45),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [MyColors.green, MyColors.darkGreen]),
                    borderRadius: BorderRadius.circular(15)),
                child: MaterialButton(
                  onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignUp())),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  minWidth: 157,
                  height: 57,
                  child: Text("Next",
                      style: GoogleFonts.sourceSansPro(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: MyColors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
