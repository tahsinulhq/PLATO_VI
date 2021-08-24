import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plato_six/constant/style.dart';
import 'package:plato_six/routing/routes.dart';
import 'package:flutter/material.dart';

class MenuController extends GetxController{
  static MenuController instance = Get.find();
  var activeItem = OverViewPageRoute.obs;
  var hoverItem = "".obs;

  changeActiveItemTo(String itemName){
    activeItem.value = itemName;
  }

  onHover(String itemName){
    if(!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;

  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName){
    switch (itemName){
      case OverViewPageRoute:
        return _customIcon(Icons.trending_up, itemName);
      case FormsPageRoute:
        return _customIcon(Icons.library_books_rounded, itemName);
      case ReportsPageRoute:
        return _customIcon(Icons.file_copy, itemName);
      case GradePageRoute:
        return _customIcon(Icons.grade, itemName);
      case AuthenticationPageRoute:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName){
    if(isActive(itemName)) return Icon(icon, size: 22, color:Colors.white,);

    return Icon(icon, color: isHovering(itemName) ? dark : orange,);
  }
}