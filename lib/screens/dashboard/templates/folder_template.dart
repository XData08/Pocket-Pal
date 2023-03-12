import "package:flutter/material.dart";
import 'package:pocket_pal/util/folder_class.dart';

class FolderTemplate extends StatelessWidget {

  final List<FolderClass> folderItem;

  const FolderTemplate({ 
    super.key,
    required this.folderItem
  });

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
    );
  }
}