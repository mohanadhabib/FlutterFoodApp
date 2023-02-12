// ignore_for_file: must_be_immutable

import 'package:final_project/infrastructure/sign_in_controller.dart';
import 'package:final_project/screens/forget_password_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style/colors.dart';

class SignIn extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color theme = Theme.of(context).scaffoldBackgroundColor;
    Shader gradient =
        LinearGradient(colors: [MyColors.green, MyColors.darkGreen])
            .createShader(Rect.fromLTWH(0, 0, 200, 70));
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
                        top: MediaQuery.of(context).size.height * 0.05),
                    child: Column(
                      children: [
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
                                color: theme == MyColors.white
                                    ? MyColors.black
                                    : MyColors.white,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w600,
                                fontSize: 13)),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Text(
              "Login To Your Account",
              style: GoogleFonts.sourceSansPro(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(15),
                color: theme == MyColors.white
                    ? MyColors.white
                    : MyColors.darkBackground,
                child: Container(
                  decoration: BoxDecoration(
                      color: theme == MyColors.white
                          ? MyColors.white
                          : MyColors.darkBackground,
                      border: Border.all(
                          color: theme == MyColors.white
                              ? MyColors.borderGrey
                              : MyColors.darkBackground,
                          width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: MyColors.green,
                      controller: ref.watch(signInProvider).email,
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: MyColors.grey),
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: GoogleFonts.sourceSansPro(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: MyColors.customGrey),
                          icon: Image.asset(
                              "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\Message.png"),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(15),
                color: theme == MyColors.white
                    ? MyColors.white
                    : MyColors.darkBackground,
                child: Container(
                  decoration: BoxDecoration(
                      color: theme == MyColors.white
                          ? MyColors.white
                          : MyColors.darkBackground,
                      border: Border.all(
                          color: theme == MyColors.white
                              ? MyColors.borderGrey
                              : MyColors.darkBackground,
                          width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextField(
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: MyColors.green,
                      obscureText: ref.watch(signInProvider).visible,
                      controller: ref.watch(signInProvider).password,
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: MyColors.grey),
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () => ref.read(signInProvider).disablePass(),
                            child: Image.asset(
                                "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\Show.png"),
                          ),
                          hintText: "Password",
                          hintStyle: GoogleFonts.sourceSansPro(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: MyColors.customGrey),
                          icon: Image.asset(
                              "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\Lock.png"),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 5),
              child: Text("Or Continue With",
                  style: GoogleFonts.sourceSansPro(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: theme == MyColors.white
                          ? MyColors.black
                          : MyColors.white)),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      color: theme == MyColors.white
                          ? MyColors.white
                          : MyColors.darkBackground,
                      child: Container(
                        height: 60,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                  "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\facebook.png"),
                              Text("Facebook",
                                  style: GoogleFonts.sourceSansPro(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: theme == MyColors.white
                                          ? MyColors.black
                                          : MyColors.white))
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: theme == MyColors.white
                                ? MyColors.white
                                : MyColors.darkBackground,
                            border: Border.all(
                                color: theme == MyColors.white
                                    ? MyColors.borderGrey
                                    : MyColors.darkBackground,
                                width: 1),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      color: theme == MyColors.white
                          ? MyColors.white
                          : MyColors.darkBackground,
                      child: Container(
                        height: 60,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                  "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\google.png"),
                              Text("Google",
                                  style: GoogleFonts.sourceSansPro(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: theme == MyColors.white
                                          ? MyColors.black
                                          : MyColors.white))
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: theme == MyColors.white
                                ? MyColors.white
                                : MyColors.darkBackground,
                            border: Border.all(
                                color: theme == MyColors.white
                                    ? MyColors.borderGrey
                                    : MyColors.darkBackground,
                                width: 1),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForgetPassword()));
              },
              child: Text("Forgot Your Password?",
                  style: GoogleFonts.sourceSansPro(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      foreground: Paint()..shader = gradient,
                      decoration: TextDecoration.underline,
                      decorationColor: MyColors.green)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [MyColors.green, MyColors.darkGreen]),
                    borderRadius: BorderRadius.circular(15)),
                child: MaterialButton(
                  onPressed: () async {
                    await ref.read(signInProvider).signIn(context);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  minWidth: 157,
                  height: 57,
                  child: Text("Login",
                      style: GoogleFonts.sourceSansPro(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: MyColors.white)),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
