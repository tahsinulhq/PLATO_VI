import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:plato_six/constant/style.dart';
import 'package:plato_six/widgets/custom_text.dart';

/// Example without datasource
class ploTableView extends StatelessWidget {
  Object? get showBorders => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 6),
                color: lightGrey.withOpacity(.1),
                blurRadius: 12)
          ],
          border: Border.all(color: lightGrey, width: .5)),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              CustomText(
                  text: "PLO Table",
                  size: 24,
                  color: Colors.grey,
                  weight: FontWeight.bold)
            ],
          ),
          DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              border: getCurrentRouteOption(context) == showBorders
                  ? TableBorder(
                      top: BorderSide(color: Colors.black),
                      bottom: BorderSide(color: Colors.grey[300]!),
                      left: BorderSide(color: Colors.grey[300]!),
                      right: BorderSide(color: Colors.grey[300]!),
                      verticalInside: BorderSide(color: Colors.grey[300]!),
                      horizontalInside:
                          BorderSide(color: Colors.grey, width: 1))
                  : null,
              columns: [
                DataColumn2(
                  label: Text('Course Name'),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Text('PLO1'),
                  numeric: true,
                ),
                DataColumn(
                  label: Text('PLO2'),
                  numeric: true,
                ),
                DataColumn(
                  label: Text('PLO3'),
                  numeric: true,
                ),
                DataColumn(
                  label: Text('PLO4'),
                  numeric: true,
                ),
              ],
              rows: List<DataRow>.generate(
                  10,
                  (index) => DataRow(cells: [
                        DataCell(CustomText(
                            text: "Course",
                            size: 12,
                            color: Colors.black,
                            weight: FontWeight.normal)),
                        DataCell(Text(((index + 2) * 10).toString())),
                        DataCell(Text(((index + 2) * 10).toString())),
                        DataCell(Text(((index + 2) * 10).toString())),
                        DataCell(Text(((index + 2) * 10).toString()))
                      ]))),
        ],
      ),
    );
  }

  getCurrentRouteOption(BuildContext context) {}
}
