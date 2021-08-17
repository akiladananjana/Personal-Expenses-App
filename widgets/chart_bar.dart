import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double amount;
  final double AmountPCTofTotal;

  ChartBar(this.day, this.amount, this.AmountPCTofTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 17,
            child: FittedBox(child: Text("\$${amount.toStringAsFixed(0)}"))),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                heightFactor: AmountPCTofTotal,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text("$day"),
      ],
    );
  }
}
