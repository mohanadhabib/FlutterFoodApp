import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/infrastructure/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var homeController =
    ChangeNotifierProvider<HomeController>((ref) => HomeController());

class HomeController extends ChangeNotifier {
  int index = 0;
  bool selectedOne = true,
      selectedTwo = false,
      selectedThree = false,
      selectedFour = false;
  void UpdateValues() {
    notifyListeners();
  }

  void changeSelected() {
    switch (index) {
      case 0:
        selectedOne = true;
        selectedTwo = false;
        selectedThree = false;
        selectedFour = false;
        notifyListeners();
        break;
      case 1:
        selectedOne = false;
        selectedTwo = true;
        selectedThree = false;
        selectedFour = false;
        notifyListeners();
        break;
      case 2:
        selectedOne = false;
        selectedTwo = false;
        selectedThree = true;
        selectedFour = false;
        notifyListeners();
        break;
      case 3:
        selectedOne = false;
        selectedTwo = false;
        selectedThree = false;
        selectedFour = true;
        notifyListeners();
        break;
    }
  }
  Stream<QuerySnapshot<Map<String, dynamic>>> getData() {
    return  Database.database.collection("Users").get().asStream();
  }
}
