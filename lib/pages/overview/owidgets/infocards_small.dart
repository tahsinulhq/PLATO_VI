import 'package:flutter/material.dart';
import 'package:plato_six/constant/style.dart';
import 'package:plato_six/widgets/custom_text.dart';

class InfocardSmall extends StatelessWidget {
  final String title;
  final String value;
  final bool isActive;
  final Function onT; 
  const InfocardSmall(
    { Key? key, 
    required this.title, 
    required this.value, 
    this.isActive =  false, 
    required this.onT }) 
    : super(key: key
    );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: (){onT;},
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isActive ? active: lightGrey,
              width: .5
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: title, 
                size: 24, 
                color: isActive ? active: lightGrey, 
                weight: FontWeight.w300
                ),

                CustomText(
                text: title, 
                size: 24, 
                color: isActive ? active: lightGrey, 
                weight: FontWeight.bold
                )
            ],
          ),

        ),
      ),
    );
  }
}