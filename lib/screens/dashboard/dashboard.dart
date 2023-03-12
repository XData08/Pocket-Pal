import "package:flutter/material.dart";
import 'package:pocket_pal/util/folder_class.dart';
import "package:pocket_pal/constants/color_const.dart";
import "package:pocket_pal/screens/dashboard/widgets/folder_widget.dart";
import "package:pocket_pal/widgets/pocket_pal_menu_button.dart";

import "package:pocket_pal/screens/dashboard/widgets/search_bar_widget.dart";
import "package:pocket_pal/screens/dashboard/widgets/card_widget.dart";

import "package:pocket_pal/screens/dashboard/templates/folder_template.dart"; 

import "package:pocket_pal/providers/dashboard_provider.dart";
import "package:provider/provider.dart";


class DashboardView extends StatefulWidget {
  const DashboardView({ super.key });

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  late final TextEditingController _folderName;
  late final TextEditingController _folderDescription;

  @override
  void initState(){
    super.initState();
    _folderName = TextEditingController(text : "");
    _folderDescription = TextEditingController(text : "");
    return;
  }

  @override
  void dispose(){
    super.dispose();  
    _folderName.dispose();
    _folderDescription.dispose();
    return;
  }

  @override
  Widget build(BuildContext context){

    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    final wPersonal = context.watch<PersonalFolderProvider>();
    final rPersonal = context.read<PersonalFolderProvider>();   

    final wGroup = context.watch<GroupFolderProvider>();
    final rGroup = context.read<GroupFolderProvider>();
    
    return Scaffold(
      backgroundColor: MyColor.white,
      body : SafeArea(
        child : NestedScrollView(
          headerSliverBuilder :(context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                surfaceTintColor: MyColor.white,
                backgroundColor: MyColor.white,
                floating: false,
                pinned: true,

                title: const Padding(
                  padding:  EdgeInsets.all(10),
                  child: PocketPalMenuButton(),
                ),
                
                expandedHeight: 360,

                flexibleSpace: FlexibleSpaceBar(
                  background : Padding(
                    padding : EdgeInsets.only(
                      top : kToolbarHeight,
                      left : screenWidth * 0.06,
                      right : screenWidth * 0.06,
                    ),
                    child: Column(
                      children : [

                        const MySearchBarWidget(),

                        SizedBox( height : screenHeight * 0.03 ),

                        MyCardWidget(
                          screenHeight : screenHeight,
                          screenWidth : screenWidth
                        ),

                      ]
                    ),
                  )
                  
                ),
              )
            ];
          },
          body : Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.07, 
              vertical: screenHeight * 0.02,
            ),
            child: SingleChildScrollView(
              child: Column(
                children : [
                      
                  MyFolderWidget(
                    folderName: "Personal Wall",
                    screenHeight: screenHeight, 
                    screenWidth: screenWidth,

                    folderLength: wPersonal.getDashboardItemLength,
                    folderItem : wPersonal.getDashboardItem,

                    folderAdd: (){
                      showDialog(
                        context: context,
                        builder:(context) {
                          return AlertDialog(
                            content : Card(
                              child : SizedBox(
                                height : 300,
                                child: Column(
                                  children : [
                                    ElevatedButton(
                                      onPressed:() {
                                        rPersonal.addItem(
                                          const FolderClass(
                                            title: "MyFolder", 
                                            subtext: "Sample"
                                          )
                                        );
                                        
                                        Navigator.of(context).pop();
                                      }, 
                                      child: Text(
                                        "Add Folder", style : TextStyle(
                                          color : Colors.black
                                        ),)
                                    )
                                  ]
                                ),
                              )
                            )
                          );
                        },
                      );
                    },
                    folderEdit: (){
                      showModalBottomSheet(
                        context: context, 
                        isScrollControlled: true,
                        builder: (context) {
                          return Padding(
                            padding : EdgeInsets.only(
                              top : 30, 
                              left : 30, 
                              right : 30,
                              bottom : MediaQuery.of(context).viewInsets.bottom
                            ),
                            child : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children : [
                                ElevatedButton(
                                    onPressed:(){
                                      rPersonal.deleteItem(0);
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      "Delete Folder", style : TextStyle(
                                        color : Colors.black
                                      ),)
                                  )
                              ]
                            )
                          );
                        }
                      );
                    },
                    folderOpen: (){

                    },

                    folderShowMore: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FolderTemplate(
                            folderItem: wPersonal.getDashboardItem,
                          )
                        ) 
                      );
                    },

                  ),

                  MyFolderWidget(
                    folderName: "Group Wall", 
                    screenHeight: screenHeight, 
                    screenWidth: screenWidth,

                    folderLength: wGroup.getDashboardItemLength,
                    folderItem : wGroup.getDashboardItem,

                    folderAdd: (){

                    },
                    folderEdit: (){
                      
                    },
                    folderOpen: (){},

                    folderShowMore: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FolderTemplate(
                            folderItem: wPersonal.getDashboardItem,
                          )
                        ) 
                      );
                    },

                  )
                      
                ]
              ),
            ),
          )
        )
      )
    );
  }
}


