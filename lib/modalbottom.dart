import 'package:flutter/material.dart';
class ModalBottom extends StatefulWidget {
  final Function(String name, String days) addTask;

  ModalBottom({Key? key, required this.addTask}) : super(key: key);

  @override
  _ModalBottomState createState() => _ModalBottomState();
}


class _ModalBottomState extends State<ModalBottom> {
  TextEditingController nameController = TextEditingController();
  TextEditingController daysController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    daysController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Container(
            height: 300,
            child: Column(
              children: [
                TextField(
                  controller: nameController, 
                  decoration: const InputDecoration(
                    labelText: 'Task name',
                  ),
                ),
                TextField(
                  controller: daysController, 
                  decoration: const InputDecoration(
                    labelText: 'Schedule ',
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                ElevatedButton(
                  child: Text('Add task'),
                  onPressed: () {
                    String name = nameController.text;
                    String days = daysController.text; 
                    if (name.isNotEmpty && days.isNotEmpty) {
                      widget.addTask(name,days);
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
  }
}
