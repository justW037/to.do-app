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
                      ListTile newTile = ListTile(
                        title: Text(inputName),
                        subtitle: Text(inputDays),
                      );
                      setState(() {
                        if(inputName.isNotEmpty){
                        _dataItems.add(newTile);
                        Navigator.pop(context); 
                        }
                      });
                      _nameController.clear();
                      _daysController.clear();
                      
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
        body: ListView.builder(
          itemCount: _dataItems.length,
          itemBuilder: (context, index) {
            return _dataItems[index];
          },
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
