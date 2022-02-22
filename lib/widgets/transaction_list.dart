import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((transaction) {
        return Card(
            child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey, width: 2),
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                // "\$" + transaction.amount.toString(),
                //both way is right
                '\$${transaction.amount}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blueGrey),
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                transaction.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: "verdana"),
              ),
              Text(
                DateFormat.yMMMd().format(transaction.date),
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ])
          ],
        ));
      }).toList(),
    );
  }
}
