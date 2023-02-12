import 'package:final_project/infrastructure/sign_up_controller.dart';
import 'package:final_project/screens/upload_preview.dart';
import 'package:final_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadPhoto extends ConsumerWidget {
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
                          "Upload Your Photo",
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: theme == MyColors.white
                                  ? MyColors.black
                                  : MyColors.white),
                        ),
                        Text(
                          "Profile",
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
                onTap: () async {
                  await ref.read(signUpProvider).galleryImage(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: MediaQuery.of(context).size.height * 0.185,
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
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                            "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\Gallery.png"),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text("From Gallery",
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: theme == MyColors.white
                                      ? MyColors.black
                                      : MyColors.white)),
                        ),
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
                onTap: () async {
                  await ref.read(signUpProvider).cameraImage(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: MediaQuery.of(context).size.height * 0.185,
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
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                            "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\camera.png"),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text("Take Photo",
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: theme == MyColors.white
                                      ? MyColors.black
                                      : MyColors.white)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.17),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [MyColors.green, MyColors.darkGreen]),
                  borderRadius: BorderRadius.circular(15)),
              child: MaterialButton(
                onPressed: () {
                  if (ref.watch(signUpProvider).gallery == null) {
                    Fluttertoast.showToast(
                        msg: "Please Choose a Profile Picture",
                        backgroundColor: MyColors.green,
                        fontSize: 15,
                        textColor: MyColors.grey,
                        gravity: ToastGravity.BOTTOM);
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UploadPreview()));
                  }
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
