import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transaction added yet!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 20,),
                Container(
                  height: 250,
                    child: Image.asset('Assets/Images/undraw_note_list_etto.png',
                        fit: BoxFit.cover))
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5,),
                                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(padding: EdgeInsets.all(8),child: FittedBox(child: Text('\$${transactions[index].amount}'))),
                    ),
                    title: Text(transactions[index].title, style: Theme.of(context).textTheme.headline6),
                    subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
                  ),
                );
              },
              // this anonymouse function is exucte buy flutter
              itemCount: transactions.length,
            ),
    );
  }
}
