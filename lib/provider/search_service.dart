import 'package:flutter/cupertino.dart';

class SearchServiceModel extends ChangeNotifier {
  bool searchOpt =true;
  // bool showOrgList = true;
  // bool showSearchList = true;



  void searchOptScreen(bool val) {

    searchOpt = val;

    notifyListeners();
  }

//   void showSearchLIstFun(bool val) {
//     showSearchList = val;
//     notifyListeners();
//   }
}
