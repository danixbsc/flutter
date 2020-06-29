import 'package:flutter/material.dart';
import 'package:udemy_personal_expanses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String id) deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: <Widget>[
              Text(
                'No transaction added yet!',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text('${transactions[index].amount}€'),
                      ),
                    ),
                  ),
                  title: Text(transactions[index].title,
                      style: Theme.of(context).textTheme.headline6),
                  subtitle: Text(
                    DateFormat('d/MMMM/y, EEEE', 'it_IT')
                        .format(transactions[index].date),
                  ),
                  trailing: IconButton(
                      onPressed: () =>
                          deleteTransaction(transactions[index].id),
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
