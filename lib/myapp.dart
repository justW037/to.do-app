import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  int _colorIndex = 0; // Biến đếm màu nền

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
                    child: const Text('Add task'),
                    onPressed: () {
                      String inputName = _nameController.text;
                      String inputDays = _daysController.text;
                      if (inputName.isNotEmpty && inputDays.isNotEmpty) {
                        ListTile newTile = ListTile(
                          title: Text(inputName),
                          subtitle: Text(inputDays),
                        );
                        setState(() {
                          _dataItems.add(newTile);
                          _colorIndex++; // Tăng biến đếm màu nền
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
          title: Text(
            'DemoApp',
            style: GoogleFonts.dancingScript(
              textStyle: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.w100),
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: GridView.count(
          mainAxisSpacing: 2.5,
          crossAxisSpacing: 2.5,
          crossAxisCount: 2,
          children: _dataItems.asMap().entries.map((entry) {
            int index = entry.key;
            ListTile listTile = entry.value;
             Color backgroundColor = (index % 4 == 0 || index % 4 == 3) ? Colors.brown : Color(0xFFD7D0AF);
             Color textColor = (backgroundColor == Colors.black) ? Colors.white : Colors.black;
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: backgroundColor,
              ),
              child: listTile,
            );
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            _showModalBottomSheet();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
