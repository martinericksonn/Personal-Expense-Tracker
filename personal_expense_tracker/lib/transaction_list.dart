// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'classes/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTransaction;
  TransactionList(this.transaction, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 524,
      child:
          transaction.isEmpty ? emptyTransaction(context) : transactionList(),
    );
  }

  Text expenseDate(int index) {
    return Text(
      DateFormat.yMMMEd().format(transaction[index].date),
    );
  }

  Text expenseName(int index, BuildContext context) {
    return Text(
      transaction[index].title,
      style: Theme.of(context).textTheme.headline6,
    );
  }

  ListTile listTile(int index, BuildContext context) {
    return ListTile(
      leading: expenseAmount(index),
      title: expenseName(index, context),
      subtitle: expenseDate(index),
      trailing: deleteExpense(context, index),
    );
  }

  ListView transactionList() {
    return ListView.builder(
      itemCount: transaction.length,
      itemBuilder: (context, index) => Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: listTile(index, context),
      ),
    );
  }

  IconButton deleteExpense(BuildContext context, int index) {
    return IconButton(
      icon: Icon(
        Icons.delete,
        color: Theme.of(context).errorColor,
      ),
      onPressed: () => deleteTransaction(index),
    );
  }

  CircleAvatar expenseAmount(int index) {
    return CircleAvatar(
      radius: 30,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Text(
            '₱${transaction[index].amount.toStringAsFixed(2)}',
          ),
        ),
      ),
    );
  }

  Column emptyTransaction(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text(
          "No transaction added yet",
          style: TextStyle(
            fontFamily: 'QuickSand',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            height: 190,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.dstIn),
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.fill,
              ),
            ))
      ],
    );
  }
}
//