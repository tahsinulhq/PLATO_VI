import 'package:flutter/material.dart';
import 'package:plato_six/helpers/responsiveness.dart';
import 'package:plato_six/constant/style.dart';
import 'custom_text.dart';


AppBar topNavigationBar(BuildContext context,  GlobalKey<ScaffoldState> key) =>


    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context) ? Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child:  Expanded(child: Container(color: orange, height: double.infinity, width: MediaQuery.of(context).size.width*.1665,))
          ),
        ],
      ) : IconButton(icon: Icon(Icons.menu), onPressed: (){
        key.currentState!.openDrawer();
      }),
      title: Container(
        child: Row(
          children: [
            // Visibility(
            //     visible: !ResponsiveWidget.isSmallScreen(context),
            //     child: CustomText(text: "", color: lightGrey, size: 20, weight: FontWeight.bold, key: key,)),
            Expanded(child: Container(),flex: 5, ),
            IconButton(icon: Icon(Icons.settings, color: dark,), onPressed: (){}),

            Stack(
              children: [
                IconButton(icon: Icon(Icons.notifications, color: dark.withOpacity(.7),), onPressed: (){}),
                Positioned(
                  top: 7,
                  right: 7,
                  child: Container(
                    width: 12,
                    height: 12,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: active,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: light, width: 2)
                    ),
                  ),
                )
              ],
            ),

            Container(
              width: 1,
              height: 22,
              color: lightGrey,
            ),
            SizedBox(width: 24,),
            CustomText(text: "Admin", color: lightGrey, size: 20, weight: FontWeight.bold,),
            SizedBox(width: 16,),
            Container(
              decoration: BoxDecoration(
                  color: active.withOpacity(.5),
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                ),
                padding: EdgeInsets.all(2),
                margin: EdgeInsets.all(2),
                child: CircleAvatar(
                  backgroundColor: light,
                  child: Icon(Icons.person_outline, color: dark,),
                ),
              ),
            )
          ],
        ),
      ),
      iconTheme: IconThemeData(color: dark),
      elevation: 0,
      backgroundColor: Colors.white,
      toolbarHeight: 80,
      leadingWidth: 450,
    );