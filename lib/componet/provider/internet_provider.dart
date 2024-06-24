import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetProvider
    with ChangeNotifier {
  Connectivity checkConnectivity = Connectivity();
  bool isInternet = true;

  void checkInternet() async
  {
    List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

    checkConnectivity.onConnectivityChanged.listen((event) {
      if (event.contains(ConnectivityResult.none)) {
        //no internet
        isInternet = false;
      }
      else {
        isInternet = true;
      }
      notifyListeners();
    }
    );
//   if(connectivityResult.contains(ConnectivityResult.none))
//     {
//       //no internet
//       isInternet = false;
//     }
//   else
//     {
//       isInternet = true;
//     }
//   notifyListeners();
// }
  }}