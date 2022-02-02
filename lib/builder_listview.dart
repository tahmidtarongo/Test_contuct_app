import 'package:flutter/material.dart';
import 'package:testapp/listview.dart';
import 'package:testapp/new_input.dart';
import 'package:provider/provider.dart';
import './provaiders/data_provaider.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Contacts')),
      ),
      body: Consumer<ContuctData>(
          builder: (context, contactProvaider, child) =>
              const MyListViewBuilder()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext contex) {
              return NewInput();
            },
          );
        },
        child: const Icon(Icons.add),
        elevation: 8,
      ),
    );
  }
}
