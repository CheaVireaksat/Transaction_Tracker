import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    // context is a meta data object with some information about widgets and it position in the tree
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constranints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transaction added yet!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: constranints.maxHeight * 0.5,
                    child: Image.asset(
                        'Assets/Images/undraw_note_list_etto.png',
                        fit: BoxFit.cover))
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 35,
                    child: Padding(
                        padding: EdgeInsets.all(12),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}'))),
                  ),
                  title: Text(transactions[index].title,
                      style: Theme.of(context).textTheme.headline6),
                  subtitle:
                      Text(DateFormat.MMMEd().format(transactions[index].date)),
                  //Trash Icon
                  trailing: MediaQuery.of(context).size.width > 360
                      ? FlatButton.icon(
                          icon: Icon(Icons.delete),
                          label: Text('Delete'),
                          textColor: Theme.of(context).errorColor,
                          onPressed: () => deleteTx(transactions[index].id),
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          //default errorColor is red
                          onPressed: () => deleteTx(transactions[index].id),
                        ),
                ),
              );
            },
            // this anonymouse function is exucte buy flutter
            itemCount: transactions.length,
          );
  }
}
