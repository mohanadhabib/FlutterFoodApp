import 'package:final_project/Widgets/chat_card.dart';
import 'package:final_project/infrastructure/chats_controller.dart';
import 'package:final_project/infrastructure/database.dart';
import 'package:final_project/screens/call_ringing.dart';
import 'package:final_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ChatScreen extends ConsumerWidget {
  String img, name, reciverID;
  ChatScreen({required this.img, required this.name, required this.reciverID});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color theme = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                    "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\images\\Pattern.png",
                    width: double.infinity,
                    fit: BoxFit.fitWidth),
                theme == MyColors.white
                    ? Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 45),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                              "D:\\Programming\\Flutter Programming\\MohanadAhmed\\final_project\\assets\\icons\\IconBack.png"),
                        ),
                      )
                    : Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 45),
                        child: InkWell(
                          onTap: () {
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
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.05),
                        child: ModifiedChatCard(
                            img: img,
                            name: name,
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CallRing(
                                          img: img,
                                          name: name,
                                          txt: 'Ringing...')));
                              var doc = await ref
                                  .read(chatProvider)
                                  .makeCall(reciverID);
                              bool? res =
                                  await FlutterPhoneDirectCaller.callNumber(
                                      doc['mobile phone']);
                              ref.watch(chatProvider).time = Stopwatch()
                                ..start();
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                child: StreamBuilder(
                  stream: ref.watch(chatProvider).getMessages(reciverID),
                  builder: (context, snapshot) => snapshot.connectionState ==
                          ConnectionState.waiting
                      ? Container()
                      : ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) => Database
                                      .auth.currentUser!.uid ==
                                  snapshot.data!.docs[index]["senderId"]
                              ? Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Expanded(
                                    child: Container(
                                      width: 50,
                                      margin: EdgeInsets.only(
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: theme == MyColors.white
                                              ? MyColors.greyBackground
                                              : MyColors.darkBackground),
                                      child: Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Text(
                                            snapshot.data!.docs[index]
                                                ["message"],
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: theme == MyColors.white
                                                    ? MyColors.black
                                                    : MyColors.white)),
                                      ),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Expanded(
                                    child: Container(
                                      width: 50,
                                      margin: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: MyColors.green),
                                      child: Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Text(
                                            snapshot.data!.docs[index]
                                                ["message"],
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: MyColors.white)),
                                      ),
                                    ),
                                  ),
                                )),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, left: 15, right: 15),
              child: Material(
                  borderRadius: BorderRadius.circular(22),
                  elevation: 2,
                  color: theme == MyColors.white
                      ? MyColors.white.withOpacity(0.85)
                      : MyColors.darkBackground.withOpacity(0.85),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: theme == MyColors.white
                          ? MyColors.white.withOpacity(0.85)
                          : MyColors.darkBackground.withOpacity(0.85),
                    ),
                    child: Container(
                      width: 20,
                      height: 20,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          minLines: 1,
                          maxLines: 5,
                          style: TextStyle(
                              fontSize: 20,
                              color: theme == MyColors.white
                                  ? MyColors.black
                                  : MyColors.white),
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          cursorHeight: 30,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                child: InkWell(
                                  onTap: () async {
                                    if (ref
                                                .watch(chatProvider)
                                                .message
                                                .text
                                                .isEmpty ==
                                            true ||
                                        ref
                                                .watch(chatProvider)
                                                .message
                                                .text
                                                .startsWith("  ") ==
                                            true ||
                                        ref.watch(chatProvider).message.text ==
                                            " ") {
                                      Fluttertoast.showToast(
                                          msg: "Please Enter a Valid Message",
                                          backgroundColor: MyColors.green,
                                          fontSize: 15,
                                          textColor: MyColors.grey,
                                          gravity: ToastGravity.BOTTOM);
                                    } else {
                                      await ref
                                          .read(chatProvider)
                                          .sendMessage(reciverID);
                                      ref.watch(chatProvider).message.clear();
                                      ref.read(chatProvider).updateChatPage();
                                    }
                                  },
                                  child: Icon(
                                    Icons.send_rounded,
                                    color: MyColors.green,
                                    size: 35,
                                  ),
                                ),
                              )),
                          cursorColor: MyColors.green,
                          controller: ref.watch(chatProvider).message,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
