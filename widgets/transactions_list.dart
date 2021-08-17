import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function DeleteTX;

  TransactionList(this.transactions, this.DeleteTX);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'No Transactions to Display!',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: FittedBox(
                                child: Text("\$${transactions[index].amount}")),
                          ),
                        ),
                        title: Text(
                          transactions[index].title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(DateFormat.yMMMd()
                            .format(transactions[index].date)),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.blue,
                          onPressed: () {
                            DeleteTX(transactions[index].id.toString());
                          },
                        )),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
