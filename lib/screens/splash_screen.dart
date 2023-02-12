import 'dart:async';
import 'package:final_project/screens/home_screen.dart';
import 'package:final_project/screens/start_screen_one.dart';
import 'package:final_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    var box = Hive.box("UserInfo");
    Timer(
        Duration(seconds: 1),
        () => box.isEmpty == true
            ? Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => StartScreenOne()))
            : Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    Shader gradient =
        LinearGradient(colors: [MyColors.green, MyColors.darkGreen])
            .createShader(Rect.fromLTWH(0, 0, 200, 70));
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(
                "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\images\\Pattern.png",
                width: double.infinity,
                fit: BoxFit.fitWidth),
            Image.asset(
                "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\images\\Logo.png"),
            Text("FoodNinja",
                style: GoogleFonts.viga(
                    foreground: Paint()..shader = gradient,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w400,
                    fontSize: 40)),
            Text("Deliever Favorite Food",
                style: GoogleFonts.inter(
                    color: Theme.of(context).scaffoldBackgroundColor ==
                            MyColors.white
                        ? MyColors.black
                        : MyColors.white,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                    fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
