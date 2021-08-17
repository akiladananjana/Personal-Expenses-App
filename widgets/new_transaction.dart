import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? pickedDate;

  void PopUpDatePicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    ).then((userPickedDate) {
      if (userPickedDate == null) {
        return;
      }
      setState(() {
        pickedDate = userPickedDate;
      });
    });
  }

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    DateTime Date = pickedDate!;

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount, Date);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  pickedDate == null
                      ? Text("No Date Choosen!")
                      : Text(
                          "Date : ${DateFormat.yMMMd().format(pickedDate!)}"),
                  TextButton(
                      onPressed: PopUpDatePicker, child: Text("Choose a Date")),
                ],
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
