import 'package:flutter/widgets.dart';

import '../utils/log.dart';

class ShadText extends StatelessWidget {
  const ShadText({required this.value, super.key});

  final String value;

  @override
  Widget build(BuildContext context) {
    log('ShadText build()');
    return Text(value);
  }
}
