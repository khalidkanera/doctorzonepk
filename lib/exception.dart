import 'package:flutter/material.dart';

class ShowExceptionDialogBox {
  static void showExceptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'توجہ کیجئے',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        content: Text('اپنا انٹرنیٹ کنکشن چیک کریں'),
        actions: [
          Center(
            child: SizedBox(
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
