import 'package:flutter/material.dart';

class MyDropdown extends StatefulWidget {
  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedOption,
      isExpanded: true,
      
      hint: Text(
        'District',
        style: TextStyle(fontSize: 12),
      ),
      onChanged: (String? newValue) {
        setState(() {
          selectedOption = newValue;
        });
      },
      items: <String>[
        'Option 1',
        'Option 2',
        'Option 3',
        'Option 4',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
