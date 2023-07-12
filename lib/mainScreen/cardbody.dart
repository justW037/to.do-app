import 'package:demo2/dataAndTheme/dataitem.dart';
import 'package:demo2/dataAndTheme/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardBody extends StatefulWidget {
  final DataItems item;
  final Function(DataItems) DeleteTask;
  final Function(String) onCompleteTask;
  final bool isCompleted;

  CardBody({Key? key, required this.item, required this.DeleteTask, required this.onCompleteTask, this.isCompleted = false})
      : super(key: key);

  @override
  _CardBodyState createState() => _CardBodyState();
}

class _CardBodyState extends State<CardBody> {
  late DateFormat dateFormat;
  late Color cardColor;

  @override
  void initState() {
    super.initState();
    dateFormat = DateFormat("dd/MM/yyyy");
    cardColor = widget.item.color;
  }

  @override
  Widget build(BuildContext context) {
    DateTime inputDate = dateFormat.parse(widget.item.days);
    Duration difference = inputDate.difference(DateTime.now());
    int differenceInDays = difference.inDays;

    cardColor = widget.isCompleted ? Colors.grey : widget.item.color;
    return Container(
      margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5,0,5,0),
                  child: Container(
                    constraints: const BoxConstraints.tightFor(
                       width: 35,
                      height: 35,
                    ),
                      decoration: BoxDecoration(
                        color: cardColor,
                        shape: BoxShape.circle,
                        border: Border.all(),
                      ),
                      child: InkWell(
                        onTap: () {
                          widget.onCompleteTask(widget.item.name);
                        },
                        child:const Icon(
                          Icons.done,
                          color: Colors.black,
                          weight: 20,
                          size: 30,
                        ),
                      ),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5,0,0,0),
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: () {
                        widget.DeleteTask(widget.item);
                      },
                      child: Icon(
                        Icons.delete_outline,
                        color: cardColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                widget.item.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.item.days,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              padding: const EdgeInsets.all(4),
              width: 120,
              height: 27,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Colors.black.withOpacity(0.055),
              ),
              child: Row(
                children: [
                  Text(
                    differenceInDays.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    ' days left',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
