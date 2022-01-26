// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'classes/constants.dart';

class ChartBar extends StatelessWidget {
  final String date;
  final double amountSpend;
  final double percentageOfTotalAmount;

  ChartBar(
    this.date,
    this.amountSpend,
    this.percentageOfTotalAmount,
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          amountAmount(),
          SizedBox(
            height: EMPTY_SPACE,
          ),
          expenseBar(context),
          SizedBox(
            height: EMPTY_SPACE,
          ),
          Text(date),
        ],
      ),
    );
  }

  SizedBox expenseBar(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 10,
      child: Stack(
        children: [
          barBackground(),
          barForeground(context),
        ],
      ),
    );
  }

  SizedBox amountAmount() {
    return SizedBox(
      height: 20,
      child: FittedBox(
        child: Text(
          '₱${amountSpend.toStringAsFixed(0)}',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  FractionallySizedBox barForeground(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: percentageOfTotalAmount,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).copyWith().primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Container barBackground() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        color: Colors.grey[350],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
