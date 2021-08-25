import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:plato_six/constant/controllers.dart';
import 'package:plato_six/constant/style.dart';

import 'custom_text.dart';

class HorizontalMenuItem extends StatelessWidget{
  final String itemName;
  final Function onTap;

  const HorizontalMenuItem({Key? key, required this.itemName, required this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){onTap;},
      onHover: (value){
        value ?
        menuController.onHover(itemName):
        menuController.onHover("not hovering")  ;
      },
      child: Obx(() => Container(
        color: menuController.isHovering(itemName)
            ? lightGrey.withOpacity(.1)
            : Colors.transparent,
        child: Row(
          children: [
            Visibility(visible: menuController.isHovering(itemName) || menuController.isActive(itemName),
            child: Container(width: 6, height: 40, color: orange,),
            maintainSize: true, maintainState: true, maintainAnimation: true,),

            SizedBox(width: _width / 80,),

            Padding(padding: EdgeInsets.all(16),
            child: menuController.returnIconFor(itemName),),

            if(!menuController.isActive(itemName))
              Flexible(child: CustomText(
                text: itemName,
                size: 14,
                color: menuController.isHovering(itemName)
                    ? dark : Color(0xFFFFFFFF),
                weight: FontWeight.normal,
              ))
            else
              Flexible(child: CustomText(
                text: itemName,
                color: Colors.white,
                size: 18,
                weight: FontWeight.bold,

              ),)
          ],
        ),
      )) ,
    );
  }
}