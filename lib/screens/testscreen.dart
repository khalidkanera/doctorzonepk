import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  static const routeName = 'tes';
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        title: Text('Test Sceen'),
      ),
      body: DataTable(
        dividerThickness: 0,
        columns: <DataColumn>[
          DataColumn(
            label: Text(''),
          ),
          DataColumn(
            label: Text(''),
          ),
        ],
        rows: <DataRow>[
          DataRow(
            cells: [
              DataCell(
                Text('my name'),
              ),
              DataCell(
                Text('my name'),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(
                Text('my name'),
              ),
              DataCell(
                Text('my name'),
              ),
            ],
          ),
          DataRow(
            cells: [
              DataCell(
                Text('my name'),
              ),
              DataCell(
                Text('my name'),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(
                Text('my name'),
              ),
              DataCell(
                Text('my name'),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(
                Text('my name'),
              ),
              DataCell(
                Text('my name'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
