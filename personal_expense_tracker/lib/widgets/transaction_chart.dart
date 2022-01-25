// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/components/transactions.dart';

class Chart extends StatelessWidget {
  Chart(this.recentTransaction, {Key? key}) : super(key: key);
  List<Transaction> recentTransaction;

  List<Map<String, Object>> get transactionAmount {
    return List.generate(7, (index) {
      final dayOfWeek = DateTime.now().subtract(
        Duration(days: index),
      );
      double sumAmount = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == dayOfWeek.day &&
            recentTransaction[i].date.month == dayOfWeek.month &&
            recentTransaction[i].date.year == dayOfWeek.year) {
          sumAmount += recentTransaction[i].amount;
        }
      }
      return {
        'day': 'T',
        'amount': 199,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(5),
    );
  }
}
