import 'package:flutter/material.dart';

class NewPokemon extends StatefulWidget {
  final Function addPokemon;

  NewPokemon(this.addPokemon);
  @override
  _NewPokemonState createState() => _NewPokemonState();
}

class _NewPokemonState extends State<NewPokemon> {
  final _nameController = TextEditingController();

  final _urlController = TextEditingController();

  void _submitData() {
    if (_urlController.text.isEmpty) {
      return;
    }

    final enteredName = _nameController.text;
    final enteredUrl = double.parse(_urlController.text);

    if (enteredName.isEmpty || enteredUrl <= 0) {
      return;
    }

    widget.addPokemon(
      enteredName,
      enteredUrl,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Column(children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Name'),
            controller: _nameController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'URL'),
            controller: _urlController,
            //   onChanged: (value) => amountInput = value,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _submitData(),
          ),
          SizedBox(height: 20),
          RaisedButton(
            child: Text('Add Pokemon'),
            textColor: Colors.white,
            color: Theme.of(context).primaryColor,
            onPressed: _submitData,
          )
        ]),
      ),
    ));
  }
}
