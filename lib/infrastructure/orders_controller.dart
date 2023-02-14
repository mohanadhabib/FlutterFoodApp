import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/infrastructure/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

var ordersProvider = ChangeNotifierProvider((ref) => OrdersProvider());

class OrdersProvider extends ChangeNotifier {
  void update() {
    notifyListeners();
  }

  Future<void> addMenu(
      String price, String name, String secondName, XFile imgFile) async {
    await Database.storage
        .ref(Database.auth.currentUser!.uid)
        .putFile(File(imgFile.path));
    String img = await Database.storage
        .ref(Database.auth.currentUser!.uid)
        .getDownloadURL();
    String id = await Database.database
        .collection("Orders")
        .doc(Database.auth.currentUser!.uid)
        .collection(Database.auth.currentUser!.uid)
        .doc()
        .id;
    await Database.database
        .collection("Orders")
        .doc(Database.auth.currentUser!.uid)
        .collection(Database.auth.currentUser!.uid)
        .doc(id)
        .set({
      'Id': id,
      'Menu Name': name,
      'Menu Second Name': secondName,
      'Price': price,
      'Image': img
    });
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAllData() async {
    return await Database.database
        .collection("Orders")
        .doc(Database.auth.currentUser!.uid)
        .collection(Database.auth.currentUser!.uid)
        .get();
  }

  Future<int> getTotalCost() async {
    int totalPrice = 0;
    var snapshot = await getAllData();
    for (int i = 0; i < snapshot.docs.length; i++) {
      totalPrice += int.parse(snapshot.docs[i]['Price']);
    }
    return await totalPrice;
  }

  Future<void> deleteItem(String Id) async {
    await Database.database
        .collection("Orders")
        .doc(Database.auth.currentUser!.uid)
        .collection(Database.auth.currentUser!.uid)
        .doc(Id)
        .delete();
  }
}
