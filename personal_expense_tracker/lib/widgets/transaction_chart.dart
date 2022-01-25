// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_tracker/components/amounts.dart';
import 'package:personal_expense_tracker/components/transactions.dart';
import 'package:personal_expense_tracker/widgets/transaction_bar.dart';

class Chart extends StatelessWidget {
  Chart(this.recentTransaction, {Key? key}) : super(key: key);
  List<Transaction> recentTransaction;

  List<Amount> get transactionAmount {
    return List.generate(7, (index) {
      final dayOfWeek = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalAmount = 0.0;
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
    });
  }

  double get totalExpenses {
    return transactionAmount.fold(
        0.0, (previousValue, element) => previousValue + element.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        margin: EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: transactionAmount.map((data) {
              return Expanded(
                child: ChartBar(
                  data.day,
                  data.amount,
                  totalExpenses == 0.0 ? 0.0 : data.amount / totalExpenses,
                ),
              );
            }).toList(),
          ),
        ));
  }
}
