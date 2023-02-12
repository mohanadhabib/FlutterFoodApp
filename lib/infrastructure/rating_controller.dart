import 'package:final_project/infrastructure/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var ratingController =
    ChangeNotifierProvider<RatingController>((ref) => RatingController());

class RatingController extends ChangeNotifier {
  TextEditingController? feedback = TextEditingController();
  double? stars;
  Future<void> ratingDriver() async {
    await Database.database
        .collection("Ratings")
        .doc(Database.auth.currentUser!.uid)
        .collection(Database.auth.currentUser!.uid)
        .doc()
        .set({
      'rating Stars': stars,
      'rating type': "Driver",
      'feedback': feedback!.text,
      'user id': Database.auth.currentUser!.uid
    });
    feedback!.clear();
    notifyListeners();
  }

  Future<void> ratingFood() async {
    await Database.database
        .collection("Ratings")
        .doc(Database.auth.currentUser!.uid)
        .collection(Database.auth.currentUser!.uid)
        .doc()
        .set({
      'rating Stars': stars,
      'rating type': "Food",
      'feedback': feedback!.text,
      'user id': Database.auth.currentUser!.uid
    });
    feedback!.clear();
    notifyListeners();
  }
}
