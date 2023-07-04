import 'package:demo2/theme.dart';
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
  
  void _showDatePicker() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2099),
    );

    if (selectedDate != null) {
      // Gán giá trị ngày được chọn vào TextEditingController
      daysController.text = "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
         final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
         if (isKeyboardVisible) {
          // Nếu bàn phím đang hiển thị, ẩn bàn phím
          FocusScope.of(context).unfocus();
          return false; // Ngăn không cho thoát khỏi màn hình
        }
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
        
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                            }, 
                            icon: Icon(Icons.arrow_back))
                      ],
                    ),
                  ),
                  const Text(
                    'Create new task', 
                    style: Heading.Heading2,
                    
                    ),
    
                  TextField(
                    controller: nameController, 
                    decoration: const InputDecoration(
                      labelText: 'Topic',
                      labelStyle: Heading.Heading3,
                      hintText: 'Write topic'
                    ),
                  ),
                  SizedBox(height: 50,),
                
                  Container(
                    child: Row(
                      children: [
                        Expanded(flex: 9,
                          child: TextFormField(
                            controller: daysController, 
                            decoration: const InputDecoration(
                              labelText: 'Date ',
                              labelStyle: Heading.Heading3,
                              hintText: 'dd/MM/yyyy',
                              ),
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                        Expanded(flex: 2, 
                          child: IconButton(
                            icon: Icon(Icons.calendar_today_outlined), 
                            onPressed: _showDatePicker,
                            ),
                            ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      child: const Text('Add task'),
                      onPressed: () {
                        String name = nameController.text;
                        String days = daysController.text; 
                        if (name.isNotEmpty && days.isNotEmpty) {
                          widget.addTask(name,days);
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
