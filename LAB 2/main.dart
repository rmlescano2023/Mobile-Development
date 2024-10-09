import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
            tabs: [
              Tab(text: "Tab 1"),
              Tab(text: "Tab 2"),
              Tab(text: "Tab 3"),
              Tab(text: "Tab 4"),
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
            Container(
              color: Colors.yellow,
              child: const Center(
                child: Text("I am the greatest showman!"),
              ),
            ),
            Container(
                color: Colors.pink,
                child: Image.asset(
                  'assets/rendon.png',
                  fit: BoxFit.cover,
                )),
            Container(
                color: Colors.blue,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text("Go to screen 1"),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text("Float"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text("asd"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.deepOrange,
                      ),
                    ),
                    DropdownButton(
                      onChanged: (value) {
                        print(value);
                      },
                      value: null,
                      items: const <DropdownMenuItem<String>>[
                        DropdownMenuItem<String>(
                          value: 'Option 1',
                          child: Text('Option 1'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Option 2',
                          child: Text('Option 2'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Option 3',
                          child: Text('Option 3'),
                        ),
                      ],
                    ),
                    PopupMenuButton(
                        onSelected: (value) {
                          print(value);
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                              const PopupMenuItem<String>(
                                value: 'Option 1',
                                child: Text('Option 1'),
                              ),
                              const PopupMenuItem<String>(
                                value: 'Option 2',
                                child: Text('Option 2'),
                              ),
                              const PopupMenuItem<String>(
                                value: 'Option 3',
                                child: Text('Option 3'),
                              ),
                            ])
                  ],
                ))),
            Container(
                color: Colors.red,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: false,
                        onChanged: (value) {
                          print(value);
                        }),
                    Radio(
                        value: false,
                        groupValue: null,
                        onChanged: (value) {
                          print(value);
                        }),
                    Switch(
                        value: false,
                        onChanged: (value) {
                          print(value);
                        }),
                    Slider(
                        value: 0.0,
                        min: 0.0,
                        max: 100.0,
                        onChanged: (value) {
                          print(value);
                        })
                  ],
                ))),
          ],
        ),
      ),
    );
  }
}
