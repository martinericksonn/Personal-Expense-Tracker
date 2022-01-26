// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double percentageOfTotalAmount;

  ChartBar(
    this.label,
    this.spendingAmount,
    this.percentageOfTotalAmount,
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Container(
            height: 20,
            child: FittedBox(
              child: Text('₱${spendingAmount.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 60,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentageOfTotalAmount,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).copyWith().primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(label),
        ],
      ),
    );
  }
}
