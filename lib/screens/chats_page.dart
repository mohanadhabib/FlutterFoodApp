import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Widgets/chat_card_item.dart';
import 'package:final_project/Widgets/nav_bar_item.dart';
import 'package:final_project/infrastructure/chats_controller.dart';
import 'package:final_project/infrastructure/home_screen_controller.dart';
import 'package:final_project/screens/chat_screen.dart';
import 'package:final_project/screens/orders_screen.dart';
import 'package:final_project/style/colors.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color theme = Theme.of(context).scaffoldBackgroundColor;
    String hour, minute;
    Timestamp time;
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
          if (val == 0) {
            Navigator.pop(context);
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
                            onTap: () {
                              ref.watch(homeController).index = 0;
                              ref.read(homeController).UpdateValues();
                              ref.read(homeController).changeSelected();
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                                "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\IconBack.png"),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 45),
                          child: InkWell(
                            onTap: () {
                              ref.watch(homeController).index = 0;
                              ref.read(homeController).UpdateValues();
                              ref.read(homeController).changeSelected();
                              Navigator.pop(context);
                            },
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
                          "Chat",
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: theme == MyColors.white
                                  ? MyColors.black
                                  : MyColors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: ref.read(chatProvider).getData(),
              builder: (context, snapshot) => snapshot.connectionState ==
                      ConnectionState.waiting
                  ? CircularProgressIndicator(
                      color: MyColors.green,
                      strokeWidth: 3,
                    )
                  : Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: snapshot.connectionState == ConnectionState.waiting
                          ? CircularProgressIndicator(
                              color: MyColors.green,
                              strokeWidth: 3,
                            )
                          : ListView.builder(
                              physics: ScrollPhysics(),
                              itemCount: snapshot.data!.size,
                              itemBuilder: (context, index) {
                                time =
                                    snapshot.data!.docs[index]["creationDate"];
                                hour = DateTime.fromMillisecondsSinceEpoch(
                                        time.seconds * 1000)
                                    .hour
                                    .toString();
                                minute = DateTime.fromMillisecondsSinceEpoch(
                                        time.seconds * 1000)
                                    .minute
                                    .toString();
                                hour.length == 1 ? hour = '0' + hour : null;
                                minute.length == 1
                                    ? minute = '0' + minute
                                    : null;
                                return Padding(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: InkWell(
                                    onTap: () async {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ChatScreen(
                                                  img:
                                                      snapshot.data!.docs[index]
                                                          ['profile image'],
                                                  name: snapshot
                                                      .data!
                                                      .docs[index]
                                                          ['profile name']
                                                      .toString()
                                                      .toUpperCase(),
                                                  reciverID: snapshot.data!
                                                      .docs[index]['id'])));
                                    },
                                    child: ChatCard(
                                        img: snapshot.data!.docs[index]
                                            ['profile image'],
                                        firstSt: snapshot
                                            .data!.docs[index]['profile name']
                                            .toString()
                                            .toUpperCase(),
                                        secondSt: "welcome",
                                        thirdSt: hour + ":" + minute),
                                  ),
                                );
                              },
                            ),
                    ))
        ],
      ),
    );
  }
}
