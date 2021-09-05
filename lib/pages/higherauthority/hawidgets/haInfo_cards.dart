import 'package:flutter/material.dart';
import 'package:plato_six/constant/style.dart';

class InfoCards extends StatelessWidget {
  final String title;
  final String value;
  final Color topColor;
  final bool isActive;
  final Function onT; 

  const InfoCards(
    { Key? key, 
      required this.title, 
      required this.value, 
      required this.topColor, 
      this.isActive = false, 
      required this.onT }) 
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: (){onT;},
        child: Container(
          height: 136,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0,6), 
                color: lightGrey.withOpacity(.1), 
                blurRadius: 12
              )
            ],borderRadius: BorderRadius.circular(8)
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Container(
                    color: topColor ,
                    height: 8,
                  )
                  )
                ],
              ),
              Expanded(child: Container()),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$title\n",
                      style: TextStyle(
                        fontSize: 16,
                        color: isActive? active: lightGrey
                      )
                    ),

                    TextSpan(
                      text: "$value\n",
                      style: TextStyle(
                        fontSize: 40,
                        color: isActive? active: dark
                      )
                    ),
                  ]
              )),
              Expanded(child: Container()),
            ],
          ),
        ),
      )
    );
  }
}