import 'package:flutter/material.dart';
import 'package:rental_vendor/constants/constants.dart';

class MyTableRow extends StatelessWidget {
  final String rowTitle;
  final String rowData;
  const MyTableRow({super.key, required this.rowData, required this.rowTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 30, top: 8, bottom: 8),
          color: richBlack.withOpacity(0.4),
          width: 150,
          child: Text(
            rowTitle,
            style: const TextStyle(color: white),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            rowData,
            style: const TextStyle(color: white),
          ),
        )
      ],
    );
  }
}
