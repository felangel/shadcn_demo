import 'package:flutter/widgets.dart';

import '../utils/log.dart';

class ShadButton extends StatelessWidget {
  const ShadButton({required this.child, this.onPressed, super.key});

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    log('ShadButton build()');
    return GestureDetector(onTap: onPressed?.call, child: child);
  }
}
