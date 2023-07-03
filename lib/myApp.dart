import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:demo2/cardbody.dart';
import 'package:demo2/dataitem.dart';
import 'package:demo2/modalbottom.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/date_symbols.dart';
import 'package:table_calendar/table_calendar.dart';

class Myapp extends StatefulWidget {
  Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  final List<DataItems> items = [];
  PageController _pageController = PageController();
  int itemCount =0;

  void _handleAddTask(String name, String days) {
    final newItem = DataItems(name: name, days: days, id: DateTime.now().toString());
    setState(() {
      items.add(newItem);
      itemCount = items.length;
    });
  }

  Future<void> _handleDeleteTask(DataItems item) async {
    bool confirmed = await confirm(
      context,
      title: const Text('Are you sure you want to delete this task?'),
      content: const Text(''),
      textOK: const Text('Delete', style: TextStyle(color: Colors.black),),
      textCancel: const Text('Cancel',style: TextStyle(color: Colors.black)),
    );

    if (confirmed) {
      setState(() {
        items.remove(item);
        itemCount = items.length;
      });
      Fluttertoast.showToast(
        msg: 'Task Deleted',
        backgroundColor: Colors.white,
        textColor: Colors.black,
      );
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'DemoApp',
            style: GoogleFonts.dancingScript(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 40,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20,0,20,0),
                child: Column(
                  children: [
                    const Align(
                        alignment: Alignment.topLeft, // Định vị văn bản sang phải
                        child: Text(
                          'Hello JustW',
                          style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
                        ),
                      ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Your \nProject($itemCount)',
                          style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
                        ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController =PageController(viewportFraction: 0.65,),
                pageSnapping: true,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Transform.translate(
                    offset: Offset(-70, 0),
                    child: CardBody(
                      item: items[index],
                      DeleteTask: _handleDeleteTask,
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: TableCalendar(
                    rowHeight: 35,
                    focusedDay: DateTime.now(),
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    firstDay: DateTime.utc(2010, 10, 01), 
                    lastDay: DateTime.utc(2099, 10, 01),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false, 
                      titleCentered: true,
                      ),
                    ),
              ),
              
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ModalBottom(addTask: _handleAddTask);
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

