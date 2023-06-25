import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _daysController = TextEditingController();
  List<ListTile> _dataItems = [];

  void _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Type Task',
                    ),
                  ),
                  TextField(
                    controller: _daysController,
                    decoration: const InputDecoration(
                      labelText: 'Type Days',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  ElevatedButton(
                    child: Text('Add task'),
                    onPressed: () {
                      String inputName = _nameController.text;
                      String inputDays = _daysController.text;
                      if (inputName.isNotEmpty) {
                        ListTile newTile = ListTile(
                          title: Text(inputName),
                          subtitle: Text(inputDays),
                        );
                        setState(() {
                          _dataItems.add(newTile);
                        });
                        _nameController.clear();
                        _daysController.clear();
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('DemoApp'),
          centerTitle: true,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: _dataItems.map((listTile) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: listTile,
            );
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showModalBottomSheet();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
