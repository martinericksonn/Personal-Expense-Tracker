// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_local_variable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function addNewTransaction;

  TransactionForm(this.addNewTransaction);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;

  void submitTransaction() {
    final inputedTitle = titleController.text;

    if (amountController.text.isEmpty) return;

    final inputedAmount = double.parse(amountController.text);

    if (inputedTitle.isEmpty || inputedAmount <= 0 || selectedDate == null) {
      return;
    }

    widget.addNewTransaction(
      titleController.text,
      double.parse(amountController.text),
      selectedDate,
    );

    Navigator.of(context).pop();
  }

  void selectDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) return;

      setState(() {
        selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            TextField(
              onSubmitted: (_) => submitTransaction(),
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              onSubmitted: (_) => submitTransaction(),
              keyboardType: TextInputType.number,
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
            ),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(selectedDate == null
                      ? 'No Date Choosen!'
                      : 'Date Picked: ${DateFormat.yMd().format(selectedDate!)} '),
                  TextButton(
                    onPressed: selectDate,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: submitTransaction,
              child: Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}
