import 'package:flutter/material.dart';
import 'package:plato_six/constant/style.dart';
import 'package:plato_six/widgets/custom_text.dart';

class haInfoCardsSmall extends StatefulWidget {
  final String title;
  final String value;
  final bool isActive;
  final Function onT;
  const haInfoCardsSmall(
      {Key? key,
      required this.title,
      required this.value,
      this.isActive = false,
      required this.onT})
      : super(key: key);

  @override
  State<haInfoCardsSmall> createState() => _haInfoCardsSmallState();
}

class _haInfoCardsSmallState extends State<haInfoCardsSmall> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          widget.onT;
        },
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: widget.isActive ? active : lightGrey, width: .5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  text: widget.title,
                  size: 18,
                  color: widget.isActive ? active : lightGrey,
                  weight: FontWeight.w300),
              CustomText(
                  text: widget.value,
                  size: 18,
                  color: widget.isActive ? active : lightGrey,
                  weight: FontWeight.bold)
            ],
          ),
        ),
      ),
    );
  }
}
