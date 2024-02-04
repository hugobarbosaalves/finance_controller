import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionForm extends StatefulWidget {
  final Function(Transaction) onSubmit;
  final bool sumOperation;

  const TransactionForm(
      {required this.onSubmit, required this.sumOperation, Key? key})
      : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _formKey = GlobalKey<FormState>();
  final _valueController = TextEditingController();
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _textController,
            decoration: const InputDecoration(labelText: 'Descrição'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira um texto';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _valueController,
            decoration: const InputDecoration(labelText: 'Valor'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira um valor';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onSubmit(Transaction(
                    value: double.parse(_valueController.text),
                    sumOperation: widget.sumOperation,
                    text: _textController.text,
                    icon: Icons.attach_money,
                    colorIcon: widget.sumOperation ? Colors.green : Colors.red,
                    colorMoney: widget.sumOperation ? Colors.green : Colors.red,
                  ));
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Salvar'),
            ),
          ),
        ],
      ),
    );
  }
}
