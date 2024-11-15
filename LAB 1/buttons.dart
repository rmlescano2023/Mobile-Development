import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  _Buttons createState() => _Buttons();
}

class _Buttons extends State<Buttons> {
  int _counter = 0;
  String _buttonText = "Click me!";
  String _selectedValue = 'Option 1';

  final List<String> _dropdownValues = [
    'Option 1',
    'Option 2',
    'Option 3',
  ];

  void _changeText() {
    setState(() {
      if (_buttonText == "Click me!") {
        _buttonText = "Thanks for clicking!";
      } else {
        _buttonText = "Click me!";
      }
    });
  }

  void _selectValue(String? value) {
    setState(() {
      _selectedValue = value ?? 'Option 1';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text('ELEVATED'),
        ),
        FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.ac_unit_sharp),
        ),
        TextButton(
          onPressed: _changeText,
          child: Text(_buttonText),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.account_tree,
            color: Colors.pink,
          ),
        ),
        PopupMenuButton<String>(
          onSelected: _selectValue,
          itemBuilder: (BuildContext context) {
            return _dropdownValues.map((String value) {
              return PopupMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList();
          },
          child: Text(_selectedValue),
        ),
        DropdownButton<String>(
          value: _selectedValue,
          onChanged: _selectValue,
          items: _dropdownValues.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
