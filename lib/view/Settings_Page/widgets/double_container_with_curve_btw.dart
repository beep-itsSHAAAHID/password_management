import 'package:flutter/material.dart';

import 'curvededges.dart';

class TCurvedEdgesWidgets extends StatelessWidget {
  const TCurvedEdgesWidgets({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: TCurvedEdges(), child: child);
  }
}
