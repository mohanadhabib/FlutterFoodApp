import 'package:final_project/infrastructure/database.dart';
import 'package:final_project/screens/sign_up_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../style/colors.dart';

final locationProvider =
    ChangeNotifierProvider<LocationProvider>((ref) => LocationProvider());

class LocationProvider extends ChangeNotifier {
  bool ison = false;
  bool? serviceEnabled;
  LocationPermission? permission;
  Position? position;
  List<Placemark>? placemark;
  Placemark? address;
  Future<void> getLocation() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.requestPermission();
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    placemark =
        await placemarkFromCoordinates(position!.latitude, position!.longitude);
    address = placemark![0];
    ison = true;
    notifyListeners();
  }

  Future<void> storeLocation(BuildContext context) async {
    if (ison == false) {
      Fluttertoast.showToast(
          msg: "Please Set Your Location First",
          backgroundColor: MyColors.green,
          fontSize: 15,
          textColor: MyColors.grey,
          gravity: ToastGravity.BOTTOM);
    } else if (ison == true) {
      await Database.database
          .collection("Users")
          .doc(Database.auth.currentUser!.uid)
          .update({
        "country": address!.country,
        "postal code": address!.postalCode,
        "address": address!.street
      });
      notifyListeners();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignUpSuccess()));
    }
  }
}
