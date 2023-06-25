
import 'dart:ffi';

import 'package:demo2/dataitem.dart';
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


void _showmodalbottomsheet() {
  showModalBottomSheet(context: this.context, builder: (context) {
    return Column(
      children: [
        TextField(controller: _nameController, 
                  decoration: InputDecoration(
                    labelText: 'Type Task'
        ),),
        TextField(controller: _daysController,
                  decoration: InputDecoration(
                    labelText: 'Type Days'
        ),),

        ElevatedButton(
          child: Text('Add task'),onPressed: (){
              
              dynamic inputname = _nameController;
              dynamic inputdays = _daysController;
              ListTile newTile = ListTile(
                title: Text(inputname),
                subtitle: Text(inputdays),
              );
              _dataItems.add(newTile);
              _nameController.clear();
              _daysController.clear();
              setState(() {
              _dataItems.add(newTile);
              });

          })
      ],
    );
  }
  );
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('DemoApp'),centerTitle: true,),
        body:  Column(
          children: [ListView(
            children: _dataItems,
            ),]
        ),

        floatingActionButton: FloatingActionButton(
          onPressed:(){  this._showmodalbottomsheet();
          },
          child: const Icon(Icons.add),
          ),
      ),
    
      );
  }
}

