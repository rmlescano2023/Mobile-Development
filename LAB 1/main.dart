import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My App"),
          bottom: const TabBar(
            tabs: const [
              Tab(text: "TEXT"),
              Tab(text: "IMAGE"),
              Tab(text: "BUTTONS"),
              Tab(text: "SELECTION")
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("John Doe"),
                accountEmail: Text("johndoe@example.com"),
                currentAccountPicture: CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text("Help"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const Center(
              child: Text(
                "Renmar Lescano",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Image.asset("images/pieck.jpg"),
            ),
            Buttons(),
            Selection(),
          ],
        ),
      ),
    );
  }
}

// ----------------------------------------------------------------------------- TAB 3 - BUTTONS
class Buttons extends StatefulWidget {
  // Constructor
  const Buttons({Key? key}) : super(key: key);

  @override
  _Buttons createState() => _Buttons();
}

class _Buttons extends State<Buttons> {
  int _counter = 0;
  String _buttonText = "Click me!";
  String _selectedValue = "Option 1";

  final List<String> _dropdownValues = [
    "Option 1",
    "Option 2",
    "Option 3",
    "Option 4",
  ];

  void _changeText() {
    setState(() {
      if (_buttonText == "Click me!") {
        _buttonText = "You clicked!";
      } else {
        _buttonText = "Click me!";
      }
    });
  }

  void _selectValue(String? value) {
    setState(() {
      _selectedValue = value ?? "Option 1"; // Default value set to "Option 1"
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          // button that displays a raised surface
          onPressed: () {},
          child: Text("Hello There!"),
        ),
        FloatingActionButton(
          // button that floats on top of other elements
          onPressed: () {},
          child: Icon(Icons.add_to_photos_sharp),
        ),
        TextButton(
          // button that displays text
          onPressed: _changeText,
          child: Text(_buttonText),
        ),
        IconButton(
          // button that displays an icon
          onPressed: () {},
          icon: const Icon(
            Icons.access_alarm,
            color: Colors.red,
          ),
        ),
        PopupMenuButton<String>(
          // button that displays a popup menu
          onSelected:
              _selectValue, // calls the selectValue function to make the changes
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
          // button that displays a dropdown menu
          value: _selectedValue,
          onChanged:
              _selectValue, // calls the selectValue function to make the changes
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

// ----------------------------------------------------------------------------- TAB 4 - SELECTIONS
class Selection extends StatefulWidget {
  // Constructor
  const Selection({Key? key}) : super(key: key);

  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Selection> {
  bool _checkboxValue = false;
  String _radioValue = "Option 1";
  bool _switchValue = false;
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.start, // aligns children to the top of widget
      children: [
        CheckboxListTile(
          // toggles check or uncheck, true or false
          title: Text("Checkbox"),
          value: _checkboxValue,
          onChanged: (value) {
            setState(() {
              _checkboxValue = value!;
            });
          },
        ),
        SizedBox(height: 20),
        Text("RADIO:"),
        RadioListTile(
          // allows to choose from given options
          title: Text("Option 1"),
          value: "Option 1",
          groupValue: _radioValue,
          onChanged: (value) {
            setState(() {
              _radioValue = value.toString();
              //toString() was used to convert the selected value to a string that can be stored in the radioValue variable
            });
          },
        ),
        RadioListTile(
          title: Text("Option 2"),
          value: "Option 2",
          groupValue: _radioValue,
          onChanged: (value) {
            setState(() {
              _radioValue = value.toString();
            });
          },
        ),
        SizedBox(height: 20),
        SwitchListTile(
          // toggles a value using a switch
          title: Text("SWITCH"),
          value: _switchValue,
          onChanged: (value) {
            setState(() {
              _switchValue = value;
            });
          },
        ),
        SizedBox(height: 20),
        Text("SLIDER"),
        Slider(
          // selects a value within a specified range
          value: _sliderValue,
          min: 0.0,
          max: 20.0,
          divisions: 100,
          label: _sliderValue.round().toString(),
          onChanged: (value) {
            setState(() {
              _sliderValue = value;
            });
          },
        ),
      ],
    );
  }
}
