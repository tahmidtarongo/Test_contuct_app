import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/provaiders/data_provaider.dart';

class NewInput extends StatelessWidget {
  NewInput({Key? key}) : super(key: key);

  late final String nameValue;
  late final String phoneValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Form(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.person),
                ),
                hintText: 'Enter contact Name: ',
                labelText: 'Name: ',
              ),
              onFieldSubmitted: (value) {
                nameValue = value;
                Provider.of<ContuctData>(context, listen: false)
                    .addName(nameValue);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.call),
                ),
                hintText: 'Enter a phone number: ',
                labelText: 'Phone Number: ',
              ),
              onFieldSubmitted: (value) {
                phoneValue = value;
                Provider.of<ContuctData>(context, listen: false)
                    .addPhone(phoneValue);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<ContuctData>(context, listen: false).updateUI();
              Navigator.pop(context);
            },
            child: const Text('Submit'),
          ),
        ],
      )),
    );
  }
}
