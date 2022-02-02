import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/builder_listview.dart';
import 'package:testapp/provaiders/data_provaider.dart';

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ContuctData(),
      child: const MaterialApp(
        home: ListViewBuilder(),
      ),
    );
  }
}
