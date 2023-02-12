import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/infrastructure/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var chatProvider =
    ChangeNotifierProvider<ChatsController>((ref) => ChatsController());

class ChatsController extends ChangeNotifier {
  Stopwatch? time;
  TextEditingController message = TextEditingController();
  Stream<QuerySnapshot<Map<String, dynamic>>> getData() {
    return Database.database
        .collection("Users")
        .where("id", isNotEqualTo: Database.auth.currentUser!.uid)
        .get()
        .asStream();
  }

  Future<void> sendMessage(String receiverId) async {
    await Database.database
        .collection("Chats")
        .doc(Database.auth.currentUser!.uid)
        .collection(receiverId)
        .doc()
        .set({
      "senderId": Database.auth.currentUser!.uid,
      "receiverId": receiverId,
      "creationDate": Timestamp.now(),
      "message": message.text
    });
    await Database.database
        .collection("Chats")
        .doc(receiverId)
        .collection(Database.auth.currentUser!.uid)
        .doc()
        .set({
      "senderId": Database.auth.currentUser!.uid,
      "receiverId": receiverId,
      "creationDate": Timestamp.now(),
      "message": message.text
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(String receiverId) {
    return Database.database
        .collection("Chats")
        .doc(Database.auth.currentUser!.uid)
        .collection(receiverId)
        .orderBy("creationDate")
        .get()
        .asStream();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> makeCall(String recieverID) {
    return Database.database.collection("Users").doc(recieverID).get();
  }

  void updateChatPage() {
    notifyListeners();
  }
}
