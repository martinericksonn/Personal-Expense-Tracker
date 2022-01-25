// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_tracker/components/amounts.dart';
import 'package:personal_expense_tracker/components/transactions.dart';

class Chart extends StatelessWidget {
  Chart(this.recentTransaction, {Key? key}) : super(key: key);
  List<Transaction> recentTransaction;

  List<Amount> get transactionAmount {
    return List.generate(7, (index) {
      final dayOfWeek = DateTime.now().subtract(
        Duration(days: index),
      );
      // var recentTransactionResult = recentTransaction
      //     .where((element) => element.date.day == dayOfWeek.day &&
      //      element.date.month == dayOfWeek.month &&
      //      element.date.year == dayOfWeek.year)
      //     .toList();

      // for (var transaction in recentTransactionResult) {
      //   sumAmount += transaction.amount;
      // }

      var totalAmount = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == dayOfWeek.day &&
            recentTransaction[i].date.month == dayOfWeek.month &&
            recentTransaction[i].date.year == dayOfWeek.year) {
          totalAmount += recentTransaction[i].amount;
        }
      }
      print(DateFormat.E().format(dayOfWeek));
      return Amount(DateFormat.E().format(dayOfWeek), totalAmount);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(transactionAmount.toString());
    // for (var item in transactionAmount.toList()) {
    //   print(item.toString());
    // }
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(5),
    );
  }
}
