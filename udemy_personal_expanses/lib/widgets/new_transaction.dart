import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime _selectedDate;

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
              keyboardType: TextInputType.text,
              //onChanged:(value) => _titleInput = value,
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              //onChanged: (value) => _amountInput = value,
              controller: _amountController,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(children: <Widget>[
                Expanded(
                  child: Text(_selectedDate == null
                      ? 'No Date Chosen!'
                      : DateFormat('d/MMMM/y, EEEE', 'it_IT')
                          .format(_selectedDate)),
                ),
                FlatButton(
                    child: Text(
                      'CHOOSE DATE',
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: _presentDatePicker),
              ]),
            ),
            RaisedButton(
              child: Text(
                'ADD TRANSACTION',
                style: Theme.of(context).textTheme.button,
              ),
              textColor: Colors.purple,
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      print('>> Fill all flieds with correct value for submitting');
      return;
    }

    print('>> Title of new transaction: ${_titleController.text}');
    print('>> Amount of new transaction: ${_amountController.text}');
    widget.addTransaction(
        _titleController.text,
        double.parse(_amountController.text),
        _selectedDate == null ? DateTime.now() : _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }
}
