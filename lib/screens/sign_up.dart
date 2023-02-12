import 'package:final_project/infrastructure/sign_up_controller.dart';
import 'package:final_project/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../style/colors.dart';

class SignUp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color theme = Theme.of(context).scaffoldBackgroundColor;
    Shader gradient =
        LinearGradient(colors: [MyColors.green, MyColors.darkGreen])
            .createShader(Rect.fromLTWH(0, 0, 200, 70));
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              children: [
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
              "Sign Up For Free",
              style: GoogleFonts.sourceSansPro(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                      keyboardType: TextInputType.name,
                      cursorColor: MyColors.green,
                      controller: ref.watch(signUpProvider).name,
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: MyColors.grey),
                      decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: GoogleFonts.sourceSansPro(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: MyColors.customGrey),
                          icon: Image.asset(
                              "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\Profile.png"),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                      controller: ref.watch(signUpProvider).email,
                      cursorColor: MyColors.green,
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
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                      obscureText: ref.watch(signUpProvider).visible,
                      controller: ref.watch(signUpProvider).password,
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: MyColors.grey),
                      cursorColor: MyColors.green,
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () => ref.read(signUpProvider).disablePass(),
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
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Checkbox(
                      side: BorderSide(color: MyColors.green),
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      splashRadius: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      activeColor: MyColors.green,
                      checkColor: MyColors.white,
                      value: ref.watch(signUpProvider).checkOne,
                      onChanged: (value) =>
                          ref.watch(signUpProvider).checkOneFun(value)),
                  Text(
                    "Keep Me Signed In",
                    style: GoogleFonts.sourceSansPro(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: MyColors.grey),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Checkbox(
                    side: BorderSide(color: MyColors.green),
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    splashRadius: 15,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    activeColor: MyColors.green,
                    checkColor: MyColors.white,
                    value: ref.watch(signUpProvider).checkTwo,
                    onChanged: (value) =>
                        ref.watch(signUpProvider).checkTwoFun(value),
                  ),
                  Text(
                    "Email Me About Special Pricing",
                    style: GoogleFonts.sourceSansPro(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: MyColors.grey),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [MyColors.green, MyColors.darkGreen]),
                  borderRadius: BorderRadius.circular(15)),
              child: MaterialButton(
                onPressed: () async {
                  await ref.read(signUpProvider).signUpAuth(context);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                minWidth: 157,
                height: 57,
                child: Text("Create Account",
                    style: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: MyColors.white)),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignIn(),
                    ));
              },
              child: Text("already have an account?",
                  style: GoogleFonts.sourceSansPro(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      foreground: Paint()..shader = gradient,
                      decoration: TextDecoration.underline,
                      decorationColor: MyColors.green)),
            ),
          ]),
        ),
      ),
    );
  }
}
