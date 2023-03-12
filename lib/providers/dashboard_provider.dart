import "package:flutter/material.dart";
import 'package:pocket_pal/util/folder_class.dart';


class PersonalFolderProvider with ChangeNotifier  {
  List<FolderClass> _dashboardItem = [
    
  ];

  List<FolderClass> get getDashboardItem => _dashboardItem;
  int get getDashboardItemLength => _dashboardItem.length;

  void addItem(FolderClass item){
    _dashboardItem.add(item);
    notifyListeners();
    return;
  }

   void deleteItem(int position){
    _dashboardItem.removeAt(position);
    notifyListeners();
    return;
  }
}

class GroupFolderProvider with ChangeNotifier  {
  List<FolderClass> _dashboardItem = [
    
  ];

  List<FolderClass> get getDashboardItem => _dashboardItem;
  int get getDashboardItemLength => _dashboardItem.length;

   void addItem(FolderClass item){
    _dashboardItem.add(item);
    notifyListeners();
    return;
  }

  void deleteItem(int position){
    _dashboardItem.removeAt(position);
    notifyListeners();
    return;
  }
}