import 'package:demo2/colors.dart';
import 'package:demo2/dataitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';



class CardBody extends StatefulWidget{
 final DataItems item;
 final Function DeleteTask;

 
 

 CardBody({Key? key, required this.item, required this.DeleteTask}) :super(key: key);
  @override
  State<CardBody> createState() => _CardBodyState();
}

class _CardBodyState extends State<CardBody> {
   late DateFormat dateFormat;

  @override
  void initState() {
    super.initState();
    dateFormat = DateFormat("dd/MM/yyyy");
  }

  @override
  Widget build(BuildContext context) {

    DateTime inputDate = dateFormat.parse(widget.item.days);
    Duration difference = inputDate.difference(DateTime.now());
    int differenceInDays = difference.inDays;
    return Container(
            
             margin: EdgeInsets.only(left: 20),
             decoration: BoxDecoration(
              color: AppColor.PrimaryColor,
              borderRadius: BorderRadius.circular(18)
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
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        ),
                      child: InkWell(
                        onTap: () {
                              widget.DeleteTask(widget.item);
                        },
                      child: const Icon(
                        Icons.delete_outline, 
                        color: Color(0xFFF9E9C8),
                        )
                        ),
                    ),
                  ),
                  const SizedBox(height: 20, ),
                  Expanded(
                    
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      widget.item.name,
                      style: const TextStyle( 
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                        ),
                        )
                        ),
                    SizedBox(height: 12,),
                  Expanded(
                    
                    child:Column(
                      children: [
                        Container(
                          child: Text(
                           widget.item.days,
                          style: const TextStyle( 
                              color: Colors.black,
                              fontSize: 19,
                              ),
                          ),
                        ),
                        SizedBox(height: 12,),
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
                                style: const TextStyle( 
                                  color: Colors.black,
                                  fontSize: 18,
                                  ),
                                  ),
                              const Text(' days left',
                                style: TextStyle(
                                    fontSize: 18,
                                  ),
                                  ),
                            ],
                          )
                              )
                      ],
                    )
                  ),
                  
                ],
              ),
             ),
            );
}
}