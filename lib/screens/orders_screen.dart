import 'package:final_project/Widgets/order_card.dart';
import 'package:final_project/data/cart_data.dart';
import 'package:final_project/infrastructure/home_screen_controller.dart';
import 'package:final_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderScreen extends ConsumerWidget {
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
                          "Order Details",
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
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.45,
            child: ListView.builder(
                physics: ScrollPhysics(),
                itemCount: CartData.name.length,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: OrderCard(
                          img: CartData.img[index],
                          firstSt: CartData.name[index],
                          secondSt: CartData.secondName[index],
                          price: CartData.price[index]),
                    )),
          ),
          Padding(
            padding: EdgeInsets.only(right: 25, left: 25, top: 15),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  image: DecorationImage(
                      image: AssetImage(
                          "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\images\\BackImage.png"),
                      fit: BoxFit.fill),
                  color: MyColors.green),
            ),
          )
        ],
      ),
    );
  }
}
