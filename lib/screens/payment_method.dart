import 'package:final_project/infrastructure/sign_up_controller.dart';
import 'package:final_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class Payment extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color theme = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
      body: Column(
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
                          "Payment Method",
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
                              "This data will be displayed in your account",
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: theme == MyColors.white
                                      ? MyColors.black
                                      : MyColors.white)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3),
                          child: Text("profile for security",
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
              child: InkWell(
                onTap: () => ref.read(signUpProvider).selectOne(),
                child: Container(
                  decoration: BoxDecoration(
                      color: theme == MyColors.white
                          ? MyColors.white
                          : MyColors.darkBackground,
                      border: ref.watch(signUpProvider).selone == true
                          ? Border.all(color: MyColors.green, width: 4)
                          : Border.all(
                              color: theme == MyColors.white
                                  ? MyColors.borderGrey
                                  : MyColors.darkBackground,
                              width: 1),
                      borderRadius: BorderRadius.circular(22)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\paypal.png")
                      ],
                    ),
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
              child: InkWell(
                onTap: () => ref.read(signUpProvider).selectTwo(),
                child: Container(
                  decoration: BoxDecoration(
                      color: theme == MyColors.white
                          ? MyColors.white
                          : MyColors.darkBackground,
                      border: ref.watch(signUpProvider).seltwo == true
                          ? Border.all(color: MyColors.green, width: 4)
                          : Border.all(
                              color: theme == MyColors.white
                                  ? MyColors.borderGrey
                                  : MyColors.darkBackground,
                              width: 1),
                      borderRadius: BorderRadius.circular(22)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\visa.png")
                      ],
                    ),
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
              child: InkWell(
                onTap: () => ref.read(signUpProvider).selectThree(),
                child: Container(
                  decoration: BoxDecoration(
                      color: theme == MyColors.white
                          ? MyColors.white
                          : MyColors.darkBackground,
                      border: ref.watch(signUpProvider).selthree == true
                          ? Border.all(color: MyColors.green, width: 4)
                          : Border.all(
                              color: theme == MyColors.white
                                  ? MyColors.borderGrey
                                  : MyColors.darkBackground,
                              width: 1),
                      borderRadius: BorderRadius.circular(22)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\payoneer.png")
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.28),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [MyColors.green, MyColors.darkGreen]),
                  borderRadius: BorderRadius.circular(15)),
              child: MaterialButton(
                onPressed: () async {
                  await ref.read(signUpProvider).signUpPaymentMethod(context);
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
    );
  }
}
