import 'package:flutter/material.dart';
import './transaction_item.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletTransaction;
  TransactionList(this.transactions, this.deletTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Text('No Transaction Added yet.',
                      style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: constraints.maxHeight * 0.4,
                      child: Image.asset('assets/images/Logo-Trans.png',
                          fit: BoxFit.cover)),
                ],
              );
            },
          )
        : ListView(children: [
            ...transactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deletTransaction: deletTransaction,
                    ))
                .toList(),
          ]
            // children: transactions.map((transaction) {}).toList(),
            );
  }
}
