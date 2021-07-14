import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/listvalues.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTX;

  TransactionList(this.transactions, this.deleteTX);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Container(
        margin: EdgeInsets.all(5),
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'Nothing to do ',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.05,
                  ),
                  Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      )),
                ],
              )
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
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                                '${transactions[index].amount.toInt()} \days'),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () => deleteTX(transactions[index].id),
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              ),
      );
    });
  }
}
