import 'package:flutter/material.dart';

class OneKey extends StatelessWidget {
  const OneKey({Key? key, required this.number}) : super(key: key);
  final int number;
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(number.toString()),
      child: Text(number.toString()),
    );
  }
}
