// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/transactions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction('01', 'Burger', 132.12, DateTime.now()),
    Transaction('02', 'Fries', 246.31, DateTime.now()),
    Transaction('03', 'Ice Cream', 152.43, DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense App'),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                elevation: 1,
                child: Text("Expense"),
              ),
            ),
            Column(
              children: transactions.map((transaction) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        // margin: EdgeInsets.symmetric(
                        //   horizontal: 15,
                        //   vertical: 10,
                        // ),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          '₱ ${transaction.amount}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transaction.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            transaction.date.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ));
  }
}
