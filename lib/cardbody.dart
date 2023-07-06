import 'package:demo2/dataitem.dart';
import 'package:demo2/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardBody extends StatefulWidget {
  final DataItems item;
  final Function(DataItems) DeleteTask;

  CardBody({Key? key, required this.item, required this.DeleteTask})
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

    if (cardColor == null) {
      // Xử lý khi cardColor là null, ví dụ: đặt màu mặc định
      cardColor = Colors.grey;
    }
    return Container(
      margin: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () {
                    widget.DeleteTask(widget.item);
                  },
                  child: Icon(
                    Icons.delete_outline,
                    color: Color(0xFFF9E9C8),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                widget.item.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.item.days,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              padding: EdgeInsets.all(4),
              width: 120,
              height: 27,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: AppColor.PrimaryColor3,
              ),
              child: Row(
                children: [
                  Text(
                    differenceInDays.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Text(
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
