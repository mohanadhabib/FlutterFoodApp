import 'package:final_project/infrastructure/reset_password_controller.dart';
import 'package:final_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPassword extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color theme = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    theme == MyColors.white
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 45),
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Image.asset(
                                  "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\IconBack.png"),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 45),
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Image.asset(
                                  "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\IconBackDark.png"),
                            ),
                          ),
                    Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Image.asset(
                        "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\images\\PatternProcess.png",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 25,
                          bottom: 10,
                          top: MediaQuery.of(context).size.height * 0.125),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Reset your password",
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: theme == MyColors.white
                                    ? MyColors.black
                                    : MyColors.white),
                          ),
                          Text(
                            "here",
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: theme == MyColors.white
                                    ? MyColors.black
                                    : MyColors.white),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                                "Select which contact details should we",
                                style: GoogleFonts.sourceSansPro(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: theme == MyColors.white
                                        ? MyColors.black
                                        : MyColors.white)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3),
                            child: Text("use to reset your password",
                                style: GoogleFonts.sourceSansPro(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: theme == MyColors.white
                                        ? MyColors.black
                                        : MyColors.white)),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(22),
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
                      borderRadius: BorderRadius.circular(22)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextField(
                      cursorColor: MyColors.green,
                      obscureText: ref.watch(reset).isLockOne,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      controller: ref.watch(reset).newPassword,
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: MyColors.grey),
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () => ref.read(reset).changeOne(),
                            child: Icon(Icons.remove_red_eye,
                                color: ref.watch(reset).isLockOne == true
                                    ? MyColors.green
                                    : MyColors.grey),
                          ),
                          hintText: "New Password",
                          hintStyle: GoogleFonts.sourceSansPro(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: MyColors.customGrey),
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
                borderRadius: BorderRadius.circular(22),
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
                      borderRadius: BorderRadius.circular(22)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextField(
                      cursorColor: MyColors.green,
                      obscureText: ref.watch(reset).isLockTwo,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      controller: ref.watch(reset).confirmPassword,
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: MyColors.grey),
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () => ref.read(reset).changeTwo(),
                            child: Icon(Icons.remove_red_eye,
                                color: ref.watch(reset).isLockTwo == true
                                    ? MyColors.green
                                    : MyColors.grey),
                          ),
                          hintText: "Confirm Password",
                          hintStyle: GoogleFonts.sourceSansPro(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: MyColors.customGrey),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.375),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [MyColors.green, MyColors.darkGreen]),
                    borderRadius: BorderRadius.circular(15)),
                child: MaterialButton(
                  onPressed: () async {
                    await ref.read(reset).resetPassword(context);
                  },
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
