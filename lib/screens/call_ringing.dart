// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:final_project/infrastructure/chats_controller.dart';
import 'package:final_project/screens/finish_order.dart';
import 'package:final_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CallRing extends ConsumerWidget {
  String name, img, txt;
  CallRing({required this.img, required this.name, required this.txt});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color theme = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
      body: Column(children: [
        Stack(
          children: [
            Image.asset(
                "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\images\\Pattern.png",
                width: double.infinity,
                fit: BoxFit.fitWidth),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.25),
              child: CircleAvatar(
                minRadius: 95,
                backgroundImage: NetworkImage(img),
                backgroundColor: MyColors.green,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 45),
          child: Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color:
                    theme == MyColors.white ? MyColors.black : MyColors.white,
                fontSize: 22),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text(
            txt,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: theme == MyColors.white
                    ? MyColors.greyBackground
                    : MyColors.white,
                fontSize: 15),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(
                  minRadius: 40,
                  backgroundColor: MyColors.transgreen,
                  child: Icon(Icons.volume_up_rounded, color: MyColors.green),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    ref.watch(chatProvider).time!.stop();
                    if (((ref.watch(chatProvider).time!.elapsed.inSeconds -
                                15) /
                            60) >
                        0) {
                      txt = ((ref.watch(chatProvider).time!.elapsed.inSeconds -
                                      15) /
                                  60)
                              .toStringAsPrecision(2) +
                          " Min";
                    } else {
                      txt = "Call Ended";
                    }
                    ref.read(chatProvider).updateChatPage();
                    Timer(
                        Duration(seconds: 3),
                        () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FinishOrder(img: img),
                            )));
                  },
                  child: CircleAvatar(
                    minRadius: 40,
                    backgroundColor: Colors.red,
                    child: Icon(Icons.close, color: MyColors.white),
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
