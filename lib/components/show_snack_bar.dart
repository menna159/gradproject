import 'package:flutter/material.dart';

import '../models/error_message.dart';

void ShowSnackbar(BuildContext context, dynamic message) {
  final snackbar = SnackBar(
    content: Text(message),
    action: SnackBarAction(label: 'Undo', onPressed: () {}),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
