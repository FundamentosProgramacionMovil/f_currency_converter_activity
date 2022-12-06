import 'package:flutter/material.dart';

import 'one_key.dart';

class KeyPad extends StatelessWidget {
  const KeyPad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OneKey(number: 1);
  }
}
