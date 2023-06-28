import 'package:demo2/dataitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class CardBody extends StatefulWidget{
 final DataItems item;
 final Function DeleteTask;

 CardBody({Key? key, required this.item, required this.DeleteTask}) :super(key: key);
  @override
  State<CardBody> createState() => _CardBodyState();
}

class _CardBodyState extends State<CardBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
             margin: EdgeInsets.only(left: 27),
             decoration: BoxDecoration(
              color: Color(0xFFF9E9C8),
              borderRadius: BorderRadius.circular(18)
             ),
             child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Expanded(
                    child: Text(
                      widget.item.name,
                      style: const TextStyle( 
                        color: Colors.black,
                        ),
                        )
                        ),
                  Expanded(child: Text(
                      widget.item.days,
                    style: const TextStyle( 
                        color: Colors.black,
                        ),
                  )
                  ),
                  InkWell(
                    onTap: () {
                          widget.DeleteTask(widget.item);
                    },
                  child: const Icon(
                    Icons.delete_outline, 
                    color: Colors.black,
                    )
                    ),
                ],
              ),
             ),
            );
}
}