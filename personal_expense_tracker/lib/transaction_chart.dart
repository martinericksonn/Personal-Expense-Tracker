// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:personal_expense_tracker/transaction_bar.dart';
import 'classes/amounts.dart';
import 'classes/constants.dart';
import 'classes/transactions.dart';

class Chart extends StatelessWidget {
  Chart(this.recentTransaction, {Key? key}) : super(key: key);
  List<Transaction> recentTransaction;

  List<Amount> get transactionAmount {
    return List.generate(DAY_IN_A_WEEK, (index) {
      final dayOfWeek = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalAmount = ZERO;
      var recentTransactionResult = recentTransaction
          .where((element) =>
              element.date.day == dayOfWeek.day &&
              element.date.month == dayOfWeek.month &&
              element.date.year == dayOfWeek.year)
          .toList();

      for (var transaction in recentTransactionResult) {
        totalAmount += transaction.amount;
      }

      return Amount(
        DateFormat.E().format(dayOfWeek),
        totalAmount,
      );
    }).reversed.toList();
  }

  double get totalExpenses {
    return transactionAmount.fold(
        ZERO, (previousValue, element) => previousValue + element.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: ELEVATION,
        margin: EdgeInsets.all(MEDIUM_SPACE),
        child: Padding(
          padding: const EdgeInsets.all(LARGE_SPACE),
          child: chartBar(),
        ));
  }

  Row chartBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: transactionAmount.map((data) {
        return Expanded(
          child: ChartBar(
            data.day,
            data.amount,
            totalExpenses == ZERO ? ZERO : data.amount / totalExpenses,
          ),
        );
      }).toList(),
    );
  }
}
