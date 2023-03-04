import 'package:flutter/material.dart';

class ErrorAlert extends StatelessWidget {
  const ErrorAlert({super.key, this.error});
  final String? error;
  @override
  Widget build(BuildContext context) => AlertDialog(
        title: const Text("ERROR"),
        content: Text("The Error is $error"),
      );
}
