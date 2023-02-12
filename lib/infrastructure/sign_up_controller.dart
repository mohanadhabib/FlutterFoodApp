import 'dart:io';
import 'package:final_project/infrastructure/database.dart';
import 'package:final_project/screens/payment_method.dart';
import 'package:final_project/screens/sign_up_process.dart';
import 'package:final_project/screens/upload_photo.dart';
import 'package:final_project/style/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';

final signUpProvider =
    ChangeNotifierProvider<SignUpController>((ref) => SignUpController());

class SignUpController extends ChangeNotifier {
  ImagePicker picker = ImagePicker();
  XFile? gallery;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController Fname = TextEditingController();
  TextEditingController Lname = TextEditingController();
  TextEditingController mobile = TextEditingController();
  bool? checkOne = false, checkTwo = false, isGallery;
  bool selone = false, seltwo = false, selthree = false;
  bool visible = true;
  String? payment;
  void selectOne() {
    selone = true;
    seltwo = false;
    selthree = false;
    notifyListeners();
  }

  void selectTwo() {
    selone = false;
    seltwo = true;
    selthree = false;
    notifyListeners();
  }

  void selectThree() {
    selone = false;
    seltwo = false;
    selthree = true;
    notifyListeners();
  }

  void checkOneFun(bool? value) {
    checkOne = value;
    notifyListeners();
  }

  void checkTwoFun(bool? value) {
    checkTwo = value;
    notifyListeners();
  }

  void disablePass() {
    visible = !visible;
    notifyListeners();
  }

  Future<void> signUpAuth(BuildContext context) async {
    try {
      await Database.auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      await signUpStore();
      Fluttertoast.showToast(
          msg: "Account Created Successfully",
          backgroundColor: MyColors.green,
          fontSize: 15,
          textColor: MyColors.grey,
          gravity: ToastGravity.BOTTOM);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignUpProcess()));
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.code.toUpperCase(),
          backgroundColor: MyColors.green,
          fontSize: 15,
          textColor: MyColors.grey,
          gravity: ToastGravity.BOTTOM);
    }
  }

  Future<void> signUpStore() async {
    await Database.database
        .collection("Users")
        .doc(Database.auth.currentUser!.uid)
        .set({
      "id": Database.auth.currentUser!.uid,
      "profile name": name.text,
      "email": email.text,
      "password": password.text,
      "creationDate":DateTime.now()
    });
    if (checkOne == true) {
      var box = Hive.box("UserInfo");
      box.putAll({
        "id": Database.auth.currentUser!.uid,
        "email": email.text,
        "password": password.text
      });
    }
  }

  Future<void> signUpStoreExtra(BuildContext context) async {
    if (Fname.text == "" || Lname.text == "" || mobile.text == "") {
      Fluttertoast.showToast(
          msg: "Please Enter All Data",
          backgroundColor: MyColors.green,
          fontSize: 15,
          textColor: MyColors.grey,
          gravity: ToastGravity.BOTTOM);
    } else {
      await Database.database
          .collection("Users")
          .doc(Database.auth.currentUser!.uid)
          .update({
        "first name": Fname.text,
        "last name": Lname.text,
        "mobile phone": mobile.text
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Payment()));
    }
  }

  Future<void> signUpPaymentMethod(BuildContext context) async {
    if (selone == true) {
      payment = 'PayPal';
    } else if (seltwo == true) {
      payment = 'Visa';
    } else if (selthree == true) {
      payment = 'Payoneer';
    }
    if (selone == true || seltwo == true || selthree == true) {
      await Database.database
          .collection("Users")
          .doc(Database.auth.currentUser!.uid)
          .update({"payment": payment});
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UploadPhoto()));
    } else {
      Fluttertoast.showToast(
          msg: "Please Choose a Payment Method",
          backgroundColor: MyColors.green,
          fontSize: 15,
          textColor: MyColors.grey,
          gravity: ToastGravity.BOTTOM);
    }
  }

  Future<void> galleryImage(BuildContext context) async {
    gallery = await picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
    var ref = await Database.storage.ref().child(Database.auth.currentUser!.uid);
    await ref.putFile(File(gallery!.path));
    await Database.database
        .collection("Users")
        .doc(Database.auth.currentUser!.uid)
        .update(
            {"profile image": await ref.getDownloadURL()});
    isGallery = true;
    notifyListeners();
  }

  Future<void> cameraImage(BuildContext context) async {
    gallery = await picker.pickImage(source: ImageSource.camera);
    notifyListeners();
    var ref = await Database.storage.ref().child(Database.auth.currentUser!.uid);
    await ref.putFile(File(gallery!.path));
    await Database.database
        .collection("Users")
        .doc(Database.auth.currentUser!.uid)
        .update(
            {"profile image": await ref.getDownloadURL()});
    isGallery = false;
    notifyListeners();
  }
}
