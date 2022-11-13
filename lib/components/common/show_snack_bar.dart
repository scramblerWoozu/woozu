import 'package:flutter/material.dart';

void showSnackBar(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}
