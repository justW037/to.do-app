
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:demo2/cardbody.dart';
import 'package:demo2/dataitem.dart';
import 'package:demo2/drawer.dart';
import 'package:demo2/modalbottom.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class Myapp extends StatefulWidget {
  Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  final List<DataItems> items = [];
  final List<String> completeTask = [];
  PageController _pageController = PageController();
  int itemCount =0;
  
  void _handleAddTask(String name, String days, Color color) {
  final newItem = DataItems(name: name, days: days, color: color);
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


  void _completeTask(String name){
    setState(() {
      completeTask.add(name);
      items.removeWhere((item) => item.name == name);
      items.forEach((item) {
      if (item.name == name) {
        item.isCompleted = true;
      }
    });

      itemCount = items.length;
    });
  }

  void _showCompleteTaskModal() {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: CompleteTask(completeTask: completeTask),
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
         iconTheme: const IconThemeData(color: Colors.black),
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
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,0),
                child: Column(
                  children: [
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Hello JustW',
                          style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
                        ),
                      ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Your Task($itemCount)',
                          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                        ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,20,0,0),
                child: PageView.builder(
                  controller: _pageController =PageController(viewportFraction: 0.65,),
                  pageSnapping: true,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Transform.translate(
                      offset: const Offset(-70, 0),
                      child: CardBody(
                        item: items[index],
                        DeleteTask: _handleDeleteTask, 
                        onCompleteTask: _completeTask,
                        isCompleted: completeTask.contains(items[index].name),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,20,20,0),
                child: TableCalendar(
                    rowHeight: 33,
                    focusedDay: DateTime.now(),
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    firstDay: DateTime.utc(2010, 10, 01), 
                    lastDay: DateTime.utc(2099, 10, 01),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false, 
                      titleCentered: true,
                      ),
                    calendarStyle: const CalendarStyle(
                      cellMargin: EdgeInsets.all(1),
                    ),
                    ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context)=> ModalBottom(addTask: _handleAddTask))
            );
          },
          child: const Icon(Icons.add),
        ),
        drawer: Drawer(
          child: DrawerBody(onShowCompleteTask: _showCompleteTaskModal,),
        ),
      ),
    );
  }
}








