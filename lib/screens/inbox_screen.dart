import 'package:flutter/material.dart';

class InboxScreen extends StatefulWidget {
  static const routeName = 'inbox screen';
  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: Text('No Mesage')),
            ),
          ),
        ],
        shrinkWrap: true,
      ),
    );
  }
}
