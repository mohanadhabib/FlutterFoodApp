import 'package:final_project/infrastructure/location_controller.dart';
import 'package:final_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationSet extends ConsumerWidget {
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
                          "Set Your Location",
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
            padding: EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(22),
              color: theme == MyColors.white
                  ? MyColors.white
                  : MyColors.darkBackground,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.2,
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
                    children: [
                      Row(
                        children: [
                          Image.asset(
                              "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\Pin.png"),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: ref.watch(locationProvider).ison == false
                                ? Text("Your Location",
                                    style: GoogleFonts.sourceSansPro(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: theme == MyColors.white
                                            ? MyColors.black
                                            : MyColors.white))
                                : Text(
                                    ref.watch(locationProvider).address!.name! +
                                        ref
                                            .watch(locationProvider)
                                            .address!
                                            .subAdministrativeArea! +
                                        ref
                                            .watch(locationProvider)
                                            .address!
                                            .administrativeArea!,
                                    style: GoogleFonts.sourceSansPro(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: theme == MyColors.white
                                            ? MyColors.black
                                            : MyColors.white)),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.065,
                          decoration: BoxDecoration(
                              color: theme == MyColors.white
                                  ? MyColors.greyBackground
                                  : MyColors.darkGreyBackground,
                              borderRadius: BorderRadius.circular(22)),
                          child: MaterialButton(
                            onPressed: () async {
                              await ref.read(locationProvider).getLocation();
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22)),
                            child: Text("Set Location",
                                style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: theme == MyColors.white
                                        ? MyColors.black
                                        : MyColors.white)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.4),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [MyColors.green, MyColors.darkGreen]),
                  borderRadius: BorderRadius.circular(15)),
              child: MaterialButton(
                onPressed: () async {
                  await ref.read(locationProvider).storeLocation(context);
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
