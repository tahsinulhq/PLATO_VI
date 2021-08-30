import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plato_six/buttons/submitbutton.dart';
import 'package:plato_six/constant/style.dart';

import 'package:plato_six/helpers/responsiveness.dart';
import 'package:plato_six/pages/instructor/cotoexam.dart';
import 'package:plato_six/pages/instructor/plotocomap.dart';
import 'package:plato_six/widgets/dropdownwidget.dart';
import 'package:plato_six/widgets/custom_text.dart';
import 'package:plato_six/constant/controllers.dart';
import 'package:plato_six/widgets/top_nav.dart';

class InstructorPage extends StatefulWidget {
  //final list = ['PLO to CO', 'CO to Exam'];
  @override
  State<InstructorPage> createState() => _InstructorPageState();
}

class _InstructorPageState extends State<InstructorPage> {
  String pc = 'PLO to CO';

  String ce = 'CO to Exam';

  @override
  Widget build(BuildContext context) {
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
                                ? 56
                                : 6),
                        child: CustomText(
                          text: menuController.activeItem.value,
                          size: 24,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ))
                  ],
                )),
            DropDownWidget(),
            SubmitButton(onPressed: () {
              print("Submitted");
            }),
            Expanded(
                child: ListView(
              children: [
                if (pc == mapdropdownValue) plotocoPage(),
                if (ce == mapdropdownValue) cotoexamPage()
              ],
            ))
          ],
        ));
  }
}
