import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //create Class and in to List
  final List<Transactions> transactions = [
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
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.orange[700],
              child: Text('CHART!'),
              elevation: 5,
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                ),
                FlatButton(
                  child: Text('Add Transaction'),
                  onPressed: () {},
                  textColor: Colors.blueGrey,
                )
              ]),
            ),
            elevation: 5,
          ),
          Column(
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
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: "verdana"),
                        ),
                        Text(
                          DateFormat.yMMMMd().format(transaction.date),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ])
                ],
              ));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
