// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_element

import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/components/transactions.dart';

import 'package:personal_expense_tracker/widgets/transaction_form.dart';
import 'package:personal_expense_tracker/widgets/transaction_list.dart';

class TransactionUser extends StatefulWidget {
  TransactionUser({Key? key}) : super(key: key);

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final List<Transaction> _usertransactions = [
    Transaction('01', 'Burger', 132.12, DateTime.now()),
    Transaction('02', 'Fries', 246.31, DateTime.now()),
    Transaction('03', 'Ice Cream', 152.43, DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
