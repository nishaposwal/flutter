import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);
  void submitData(ctx) {
    if (titleController.text.isEmpty || amountController.text.isEmpty) {
      return;
    }
    addTx(titleController.text, double.parse(amountController.text));
    Navigator.of(ctx).pop();
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
              onSubmitted: (_) => submitData(context),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'amount'),
              controller: amountController,
              onSubmitted: (_) => submitData(context),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () => submitData(context),
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
