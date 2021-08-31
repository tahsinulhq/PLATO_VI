import 'package:flutter/material.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:plato_six/buttons/submitbutton.dart';
import 'package:plato_six/constant/style.dart';
import 'package:plato_six/helpers/responsiveness.dart';
import 'package:plato_six/pages/instructor/instwidget.dart';
import 'package:plato_six/widgets/custom_text.dart';
import 'package:plato_six/constant/controllers.dart';

class InstructorPage extends StatefulWidget {
  @override
  State<InstructorPage> createState() => _InstructorPageState();
}

class _InstructorPageState extends State<InstructorPage> {
  String cp = 'CO to PLO';

  String ce = 'CO to Exam';
=======

import 'package:plato_six/helpers/responsiveness.dart';
import 'package:plato_six/widgets/custom_text.dart';
import 'package:plato_six/constant/controllers.dart';
>>>>>>> 39e31e24a9e2f8918e334db46602b96763ae81eb

class InstructorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Container(
        padding: EdgeInsets.all(24),
        margin: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 6),
                color: lightGrey.withOpacity(.1),
                blurRadius: 12)
          ],
          border: Border.all(color: lightGrey, width: .5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            top: ResponsiveWidget.isSmallScreen(context)
                                ? 54
                                : 6),
                        child: CustomText(
                          text: menuController.activeItem.value,
                          size: 24,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ))
                  ],
                )),
            //DropDownWidget(),
            SubmitButton(onPressed: () {
              print("Submitted");
            }),
            Expanded(
                child: ListView(
              children: [
                AdminDashboard(),
                //if (cp == mapdropdownValue) plotocoPage(),
                //if (ce == mapdropdownValue) cotoexamPage()
              ],
            ))
          ],
        ));
=======
    // TODO: implement build
    return Center(
        child: CustomText(
      text: "Instructor",
      size: 18,
      weight: FontWeight.bold,
      color: Colors.black87,
    ));
>>>>>>> 39e31e24a9e2f8918e334db46602b96763ae81eb
  }
}
