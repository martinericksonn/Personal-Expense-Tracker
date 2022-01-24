// ignore_for_file: prefer_const_constructors, sized_box_for_whitespaceimport 'dart:html';

import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/widgets/transaction_form.dart';
import 'package:personal_expense_tracker/widgets/transaction_list.dart';

import 'components/transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense App',
      theme: ThemeData(
        fontFamily: 'QuickSand',
        primarySwatch: Colors.purple,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.purple,
          secondary: Colors.amber, // Your accent color
        ),
      ),
      home: MyHomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _usertransactions = [
    Transaction('01', 'Burger', 132.12, DateTime.now()),
    Transaction('02', 'Fries', 246.31, DateTime.now()),
    Transaction('03', 'Ice Cream', 152.43, DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
      DateTime.now().toString(),
      title,
      amount,
      DateTime.now(),
    );

    setState(() => _usertransactions.add(newTransaction));
  }

  void openAddTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense App'),
          actions: [
            IconButton(
              onPressed: () => openAddTransaction(context),
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 1,
                  child: Text(" "),
                ),
              ),
              TransactionList(_usertransactions)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => openAddTransaction(context),
          child: Icon(Icons.add),
        ));
  }
}
