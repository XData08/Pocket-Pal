import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:google_fonts/google_fonts.dart";
import "package:flutter_svg/flutter_svg.dart";

import "package:pocket_pal/constants/color_const.dart";

import 'package:pocket_pal/util/folder_class.dart';


class MyFolderWidget extends StatelessWidget {

  final void Function() ? folderShowMore;
  final void Function() ? folderAdd;
  final void Function() ? folderEdit;
  final void Function() ? folderOpen;
  
  final String folderName;

  final double screenHeight;
  final double screenWidth;

  final List<FolderClass> folderItem;
  final int folderLength;

  const MyFolderWidget({ 
    super.key,
    required this.folderName,
    required this.screenHeight,
    required this.screenWidth,
    this.folderShowMore,

    required this.folderLength,
    required this.folderItem,

    required this.folderAdd,
    required this.folderEdit,
    required this.folderOpen,
    
   });

  @override
  Widget build(BuildContext context){
    return Column(
      children : [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              folderName,
              style: GoogleFonts.poppins(
                color : MyColor.grey
              ),
            ),
        
            GestureDetector(
              onTap : folderShowMore,
              child: Text(
                "show more",
                style: GoogleFonts.poppins(
                  color : MyColor.rustic
                ),
              ),
            ),
          ],
        ),
        
        const SizedBox( height : 10),
        
        SizedBox(
          width : screenWidth,
          height : 180,
          child: GridView.builder(
            scrollDirection: Axis.horizontal, 
            itemCount: (folderLength==0) ? 1 : (folderLength >= 10) ? 11 : folderLength+1,
                    
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
            ),
                    
            itemBuilder: (context, index){


              if ( folderLength == index ){
                return Stack(
                  fit : StackFit.passthrough,
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children : [
                    SvgPicture.asset(
                      "assets/icon/Folder.svg",
                    ),

                    IconButton(
                      icon : const Icon(
                        FeatherIcons.plusCircle,
                        size : 50
                        ),
                      onPressed: folderAdd,
                    )
                  ]
                );
              } else {
                return GestureDetector(
                  onLongPress: folderEdit,
                  onTap : folderOpen,
                  child: Stack(
                    fit : StackFit.passthrough,
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children : [
                      SvgPicture.asset(
                        "assets/icon/Folder.svg",
                      ),
                
                      Positioned(
                        bottom : 45,
                        left : 25,
                        child : Text(
                          folderItem[index].title,
                          style : GoogleFonts.montserrat(
                            fontSize : 16,
                            fontWeight: FontWeight.w600
                          )
                        )
                      ),
                
                      Positioned(
                        bottom : 30,
                        left : 25,
                        child : Text(
                          folderItem[index].subtext,
                          style : GoogleFonts.montserrat(
                            color : MyColor.grey,
                          )
                        )
                      ),
              
                    ]
                  ),
                );
              }
            },
          ),
        )
      ]
    );
  }
}