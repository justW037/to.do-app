import 'package:demo2/dataAndTheme/theme.dart';
import 'package:flutter/material.dart';

class DrawerBody extends StatelessWidget {
  final Function() onShowCompleteTask;

  const DrawerBody({
    Key? key,
    required this.onShowCompleteTask,
  }) : super(key: key);

        

  @override
  Widget build(BuildContext context) {
    return ListView(
       padding: EdgeInsets.zero,
       children: [
        const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Text(
                  'More Option',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
        ListTile(
          title: const Text('Done', style: Heading.Heading2),
          onTap: onShowCompleteTask,
        ),
       ],
    );
  }
}




class CompleteTask extends StatelessWidget {
  const CompleteTask({
    Key? key,
    required this.completeTask,
  }) : super(key: key);

  final List<String> completeTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle, 
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      height: 500,
      child: Column(
        children: [
          Container(
            child: const Text(
              'Task completed',
              style: Heading.Heading2,
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: completeTask.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(completeTask[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
