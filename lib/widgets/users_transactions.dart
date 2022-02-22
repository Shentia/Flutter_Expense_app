import 'package:flutter/material.dart';
import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transactions> _userTransactions = [
    Transactions(
      id: "#1",
      title: "Shoes",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transactions(
      id: "#2",
      title: "Foods",
      amount: 40.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String transactionTitle, double transactionAmount) {
    final newTransaction = Transactions(
      title: transactionTitle,
      amount: transactionAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
