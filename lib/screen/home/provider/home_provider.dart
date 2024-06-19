import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier
{
  bool isIos = false;
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  String selectedSegment = "chat";
  int selectedIndex = 0;

  void changeBottomBar(int value)
  {
    selectedIndex = value;
    notifyListeners();
  }

  void isSelect(String? select)
  {
    selectedSegment = select!;
    notifyListeners();
  }

  void isCheck()
  {
    isIos = !isIos;
    notifyListeners();

  }

  void Date(DateTime d1)
  {
    date = d1;
    notifyListeners();
  }

  void changeTime(TimeOfDay t1)
  {
    time = t1;
    notifyListeners();
  }
}