import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provaiders/data_provaider.dart';

class MyListViewBuilder extends StatelessWidget {
  const MyListViewBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ContuctData>(
      builder: (context, contuct, chaild) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              elevation: 8,
              margin: const EdgeInsets.all(7),
              color: Colors.grey[300],
              child: ListTile(
                title: Text(contuct.name[index]),
                subtitle: Text(contuct.phoneNumber[index]),
                leading: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.person),
                ),
              ),
            );
          },
          itemCount: contuct.name.length,
        );
      },
    );
  }
}
