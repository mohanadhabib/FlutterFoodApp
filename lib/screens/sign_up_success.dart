import 'package:final_project/screens/home_screen.dart';
import 'package:final_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpSuccess extends StatefulWidget {
  @override
  State<SignUpSuccess> createState() => _SignUpSuccessState();
}

class _SignUpSuccessState extends State<SignUpSuccess> {
  @override
  Widget build(BuildContext context) {
    Color theme = Theme.of(context).scaffoldBackgroundColor;
    Shader gradient =
        LinearGradient(colors: [MyColors.green, MyColors.darkGreen])
            .createShader(Rect.fromLTWH(0, 0, 200, 70));
    return Scaffold(
      body: Center(
        child: Column(children: [
          Stack(
            children: [
              Image.asset(
                  "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\images\\Pattern.png",
                  width: double.infinity,
                  fit: BoxFit.fitWidth),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.3),
                  child: Image.asset(
                    "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\SuccessImage.png",
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text(
              "Congrats!",
              style: GoogleFonts.sourceSansPro(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                foreground: Paint()..shader = gradient,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text(
              "Your Profile Is Ready To Use",
              style: GoogleFonts.sourceSansPro(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color:
                    theme == MyColors.white ? MyColors.black : MyColors.white,
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.23),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [MyColors.green, MyColors.darkGreen]),
                  borderRadius: BorderRadius.circular(15)),
              child: MaterialButton(
                onPressed: () async {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                minWidth: 157,
                height: 57,
                child: Text("Try Order",
                    style: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: MyColors.white)),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
