import 'package:final_project/Widgets/order_card.dart';
import 'package:final_project/data/cart_data.dart';
import 'package:final_project/infrastructure/home_screen_controller.dart';
import 'package:final_project/infrastructure/orders_controller.dart';
import 'package:final_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderScreen extends ConsumerStatefulWidget {
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderScreen();
}

class _OrderScreen extends ConsumerState<OrderScreen> {
  int subTotal = 0;
  int total = 30;
  @override
  void initState() {
    // int SubTotal = await ref.watch(ordersProvider).getTotalCost();
    super.initState();
    for (int i = 0; i < CartData.price.length; i++) {
      subTotal += int.parse(CartData.price[i].replaceAll('\$', ''));
    }
    total += subTotal;
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
                      child: Dismissible(
                        key: Key(index.toString()),
                        direction: DismissDirection.endToStart,
                        onDismissed: (dir) async {
                          /*
                            await ref.read(ordersProvider).deleteItem(
                                snapshot.data!.docs.iterator.current.id); */
                          CartData.img.removeAt(index);
                          CartData.name.removeAt(index);
                          CartData.price.removeAt(index);
                          CartData.secondName.removeAt(index);
                          ref.read(ordersProvider).update();
                        },
                        child: OrderCard(
                            img: CartData.img[index],
                            firstSt: CartData.name[index],
                            secondSt: CartData.secondName[index],
                            price: CartData.price[index]),
                      ),
                    )),
          ),
          Padding(
            padding: EdgeInsets.only(right: 25, left: 25, top: 15),
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25, right: 35, left: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sub-Total',
                            style: TextStyle(
                                color: MyColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400)),
                        Text(subTotal.toString() + ' \$',
                            style: TextStyle(
                                color: MyColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 35, left: 35, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Delivery Charge',
                            style: TextStyle(
                                color: MyColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400)),
                        Text(10.toString() + ' \$',
                            style: TextStyle(
                                color: MyColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 35, left: 35, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Discount',
                            style: TextStyle(
                                color: MyColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400)),
                        Text(20.toString() + ' \$',
                            style: TextStyle(
                                color: MyColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 35, left: 35, top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',
                            style: TextStyle(
                                color: MyColors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                        Text(total.toString() + ' \$',
                            style: TextStyle(
                                color: MyColors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: MaterialButton(
                        onPressed: () {},
                        color: MyColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 70),
                          child: Text(
                            "Place My Order",
                            style: TextStyle(
                                color: MyColors.green,
                                fontSize: 21,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  )
                ],
              ),
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
