import 'package:final_project/Widgets/horizontal_card_item.dart';
import 'package:final_project/Widgets/nav_bar_item.dart';
import 'package:final_project/data/cart_data.dart';
import 'package:final_project/data/menu_data.dart';
import 'package:final_project/infrastructure/home_screen_controller.dart';
import 'package:final_project/screens/chats_page.dart';
import 'package:final_project/screens/filter_page.dart';
import 'package:final_project/screens/food_rating.dart';
import 'package:final_project/screens/orders_screen.dart';
import 'package:final_project/style/colors.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreMenus extends ConsumerWidget {
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
                "Popular Menu",
                style: GoogleFonts.sourceSansPro(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: theme == MyColors.white
                        ? MyColors.black
                        : MyColors.white),
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.9,
              child: ListView.builder(
                itemCount: MenuData.name.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: InkWell(
                    onTap: () async {
                      /*
                      await ref.read(ordersProvider).addMenu(
                          MenuData.price[index],
                          MenuData.name[index],
                          MenuData.secondName[index],
                          MenuData.imgFile[index]);
                           */
                      CartData.img.add(MenuData.img[index]);
                      CartData.name.add(MenuData.name[index]);
                      CartData.secondName.add(MenuData.secondName[index]);
                      CartData.price.add(MenuData.price[index]);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FoodRate(img: MenuData.img[index])));
                    },
                    child: MyHorizontalCard(
                        img: MenuData.img[index],
                        firstSt: MenuData.name[index],
                        secondSt: MenuData.secondName[index],
                        price: MenuData.price[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
