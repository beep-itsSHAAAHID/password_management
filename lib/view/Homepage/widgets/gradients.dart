import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<LinearGradient> cardGradients = [
  const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xff09203F), Color(0xff537895)],
  ),
  const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Color(0xff37D5D6), Color(0xff36096D)],
  ),
  const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xff37D5D6), Color(0xff36096D)],
  ),
  const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xff2C3E50), Color(0xff000000)],
  ),
  // Add more gradients as desired
];
