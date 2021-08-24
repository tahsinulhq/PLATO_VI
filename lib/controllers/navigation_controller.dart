import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NavigationController extends GetxController{
  static NavigationController instance = Get.find();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Future<dynamic>? navigateTo(String routeName){
    return navigatorKey.currentState?.pushNamed(routeName);
  }
  goBack() => navigatorKey.currentState?.pop();
}