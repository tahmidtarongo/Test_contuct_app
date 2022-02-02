import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContuctData with ChangeNotifier {

  late String nameValue;
  late String phoneValue;
  final List<String> _name = [
    'Tarongo',
    'Tamim',
    'Turag',
  ];
  final List<String> _phoneNumber = [
    '01631865339',
    '01631865339',
    '01631865339',
  ];

  List get name => _name;
  List get phoneNumber => _phoneNumber;

  void addName(String value){
    nameValue = value;
  }
  void addPhone(String value){
    phoneValue = value;
  }

  void updateUI(){
    _name.add(nameValue);
    _phoneNumber.add(phoneValue);
    notifyListeners();
  }

  // void addName(String value) {
  //   _name.add(value);
  //   print(_name);
  //   notifyListeners();
  // }

  // void addNumber(String value) {
  //   _phoneNumber.add(value);
  //   print(_phoneNumber);
  //   notifyListeners();
  // }
}
