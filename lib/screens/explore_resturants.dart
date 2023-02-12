import 'package:final_project/Widgets/card_item_repeated.dart';
import 'package:final_project/Widgets/nav_bar_item.dart';
import 'package:final_project/infrastructure/home_screen_controller.dart';
import 'package:final_project/screens/chats_page.dart';
import 'package:final_project/screens/filter_page.dart';
import 'package:final_project/screens/orders_screen.dart';
import 'package:final_project/style/colors.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreRest extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color theme = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
      bottomNavigationBar: FloatingNavbar(
        items: [
          FloatingNavbarItem(
              customWidget: NavItem(
                  isSelected: ref.watch(homeController).selectedOne,
                  icon:
                      "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\Home.png",
                  text: "Home")),
          FloatingNavbarItem(
              customWidget: NavItem(
                  isSelected: ref.watch(homeController).selectedTwo,
                  icon:
                      "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\Icon Profile.png",
                  text: "Profile")),
          FloatingNavbarItem(
              customWidget: NavItem(
                  isSelected: ref.watch(homeController).selectedThree,
                  icon:
                      "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\Icon Cart.png",
                  text: "Cart")),
          FloatingNavbarItem(
              customWidget: NavItem(
                  isSelected: ref.watch(homeController).selectedFour,
                  icon:
                      "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\Chat.png",
                  text: "Chat")),
        ],
        currentIndex: ref.watch(homeController).index,
        onTap: (val) {
          ref.watch(homeController).index = val;
          ref.watch(homeController).changeSelected();
          ref.read(homeController).UpdateValues();
          if (val == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OrderScreen()));
          }
          if (val == 3) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ChatsPage()));
          }
        },
        borderRadius: 22,
        selectedBackgroundColor: theme == MyColors.white
            ? MyColors.backgroundGreen
            : MyColors.menuItemBlack,
        fontSize: 15,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        backgroundColor:
            theme == MyColors.white ? MyColors.white : MyColors.darkBackground,
        margin: EdgeInsets.all(10),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Image.asset(
                        "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\images\\PatternProcess.png",
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.8,
                            top: MediaQuery.of(context).size.height * 0.08),
                        child: Material(
                            color: theme == MyColors.white
                                ? MyColors.white
                                : MyColors.darkGreyBackground,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: theme == MyColors.white
                                      ? MyColors.white
                                      : MyColors.darkGreyBackground,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Image.asset(
                                  "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\IconNotifiaction.png"),
                            ))),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 25,
                          top: MediaQuery.of(context).size.height * 0.075),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Find Your",
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 33,
                                fontWeight: FontWeight.w700,
                                color: theme == MyColors.white
                                    ? MyColors.black
                                    : MyColors.white),
                          ),
                          Text(
                            "Favorite Food",
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 33,
                                fontWeight: FontWeight.w700,
                                color: theme == MyColors.white
                                    ? MyColors.black
                                    : MyColors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      color: theme == MyColors.white
                          ? MyColors.orange
                          : MyColors.darkBackground,
                      child: Container(
                        decoration: BoxDecoration(
                            color: theme == MyColors.white
                                ? MyColors.orange
                                : MyColors.darkBackground,
                            border: Border.all(
                                color: theme == MyColors.white
                                    ? MyColors.orange
                                    : MyColors.darkBackground,
                                width: 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                          child: TextField(
                            cursorColor: theme == MyColors.white
                                ? MyColors.orangeText
                                : MyColors.grey,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: MyColors.grey),
                            decoration: InputDecoration(
                                prefixIcon: theme == MyColors.white
                                    ? Image.asset(
                                        "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\IconSearch.png")
                                    : Image.asset(
                                        "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\IconSearchDark.png"),
                                hintText: "What do you want to order?",
                                hintStyle: GoogleFonts.sourceSansPro(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: theme == MyColors.white
                                        ? MyColors.orangeText
                                        : MyColors.grey),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => FilterPage()))),
                      child: Material(
                        borderRadius: BorderRadius.circular(15),
                        color: theme == MyColors.white
                            ? MyColors.orange
                            : MyColors.darkBackground,
                        child: Container(
                          decoration: BoxDecoration(
                              color: theme == MyColors.white
                                  ? MyColors.orange
                                  : MyColors.darkBackground,
                              border: Border.all(
                                  color: theme == MyColors.white
                                      ? MyColors.orange
                                      : MyColors.darkBackground,
                                  width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: theme == MyColors.white
                                  ? Image.asset(
                                      "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\FilterIcon.png")
                                  : Image.asset(
                                      "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\FilterDark.png")),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 20),
              child: Text(
                "Popular Restaurant",
                style: GoogleFonts.sourceSansPro(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: theme == MyColors.white
                        ? MyColors.black
                        : MyColors.white),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: GridView.count(
                physics: ScrollPhysics(),
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: MyCardRepeated(
                        img:
                            "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\images\\Resturant_one.png",
                        firstSt: "Vegan Resto",
                        secondSt: "12 Mins"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 20),
                    child: MyCardRepeated(
                        img:
                            "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\images\\Restaurant_two.png",
                        firstSt: "Healthy Food",
                        secondSt: "8 Mins"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: MyCardRepeated(
                        img:
                            "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\images\\Restaurant_three.png",
                        firstSt: "Good Food",
                        secondSt: "12 Mins"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 20),
                    child: MyCardRepeated(
                        img:
                            "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\images\\Restaurant_four.png",
                        firstSt: "Smart Resto",
                        secondSt: "8 Mins"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: MyCardRepeated(
                        img:
                            "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\images\\Restaurant_five.png",
                        firstSt: "Vegan Resto",
                        secondSt: "12 Mins"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 20),
                    child: MyCardRepeated(
                        img:
                            "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\images\\Restaurant_six.png",
                        firstSt: "Healthy Food",
                        secondSt: "8 Mins"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
