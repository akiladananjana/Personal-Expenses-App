import 'package:first_project/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactions;

  Chart(this.transactions);

  List<Map<String, Object>> get GroupedTransactionVals {
    return List.generate(7, (index) {
      final WeekDate = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;

      for (int i = 0; i < transactions.length; i++) {
        if (transactions[i].date.day == WeekDate.day &&
            transactions[i].date.month == WeekDate.month &&
            transactions[i].date.year == WeekDate.year) {
          totalSum = totalSum + transactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(WeekDate).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double getTotalSum() {
    double total = 0.0;

    for (var i = 0; i < GroupedTransactionVals.length; i++) {
      total += (GroupedTransactionVals[i]['amount'] as double);
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: GroupedTransactionVals.map((tx) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  tx['day'].toString(),
                  tx['amount'] as double,
                  getTotalSum() == 0
                      ? 0
                      : (tx['amount'] as double) / getTotalSum()),
            );
          }).toList(),
        ),
      ),
    );
  }
}
