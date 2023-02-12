import 'package:final_project/infrastructure/get_phone_email.dart';
import 'package:final_project/screens/reset_password.dart';
import 'package:final_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends ConsumerStatefulWidget {
  @override
  ConsumerState<ForgetPassword> createState() => _ForgetPassword();
}

class _ForgetPassword extends ConsumerState<ForgetPassword> {
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await ref.read(getProvider).getPhoneEmail();
  }

  @override
  Widget build(BuildContext context) {
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
                          "Forgot password?",
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: theme == MyColors.white
                                  ? MyColors.black
                                  : MyColors.white),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("Select which contact details should we",
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
              padding: EdgeInsets.only(left: 20, right: 20, top: 25),
              child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(22),
                  color: theme == MyColors.white
                      ? MyColors.white
                      : MyColors.darkBackground,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: MediaQuery.of(context).size.height * 0.15,
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
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Image.asset(
                              "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\MessageIcon.png"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Via sms:",
                                  style: GoogleFonts.sourceSansPro(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: theme == MyColors.white
                                          ? MyColors.black
                                          : MyColors.white)),
                              ref.watch(getProvider).phone == null
                                  ? Text("")
                                  : Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Text(ref.watch(getProvider).phone!,
                                          style: GoogleFonts.sourceSansPro(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: theme == MyColors.white
                                                  ? MyColors.black
                                                  : MyColors.white)),
                                    )
                            ],
                          ),
                        )
                      ],
                    ),
                  ))),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 35),
              child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(22),
                  color: theme == MyColors.white
                      ? MyColors.white
                      : MyColors.darkBackground,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: MediaQuery.of(context).size.height * 0.115,
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
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Image.asset(
                              "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\EmailIcon.png"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Via sms:",
                                  style: GoogleFonts.sourceSansPro(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: theme == MyColors.white
                                          ? MyColors.black
                                          : MyColors.white)),
                              ref.watch(getProvider).email == null
                                  ? Text("")
                                  : Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Text(ref.watch(getProvider).email!,
                                          style: GoogleFonts.sourceSansPro(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: theme == MyColors.white
                                                  ? MyColors.black
                                                  : MyColors.white)),
                                    )
                            ],
                          ),
                        )
                      ],
                    ),
                  ))),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResetPassword()));
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
