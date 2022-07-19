import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final String error;
  const ErrorWidget({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}
