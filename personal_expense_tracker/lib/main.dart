// ignore_for_file: prefer_const_constructors, sized_box_for_whitespaceimport 'dart:html';, prefer_const_constructors_in_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/widgets/transaction_chart.dart';
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
      title: 'Expense Tracker ',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
              fontFamily: 'QuickSand',
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
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
  final List<Transaction> userTransactions = [
    // Transaction('01', 'Burger', 132.12, DateTime.now()),
    // Transaction('02', 'Fries', 246.31, DateTime.now()),
    // Transaction('03', 'Ice Cream', 152.43, DateTime.now()),
  ];

  void deleteTransaction(int index) {
    setState(() {
      userTransactions.removeAt(index);
    });
  }

  void addNewTransaction(String title, double amount, DateTime dateSeleted) {
    final newTransaction = Transaction(
      DateTime.now().toString(),
      title,
      amount,
      dateSeleted,
    );

    setState(() => userTransactions.add(newTransaction));
  }

  void openAddTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(addNewTransaction);
      },
    );
  }

  List<Transaction> get recentTransaction {
    return userTransactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense Tracker'),
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
              SizedBox(
                width: double.infinity,
                child: Chart(userTransactions),
              ),
              TransactionList(userTransactions, deleteTransaction)
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
