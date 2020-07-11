

import 'package:btps/model/transactDetail.dart';
import 'package:btps/theme/app_color.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget{
  final String date;
  
  List<TransactionDetail> details = [];
  TransactionPage({@required this.date, this.details});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color(0xffEEF2F5),
      // padding: EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 8, left: 8,bottom: 8, right: 8),
             child: Text(date, style: TextStyle(fontSize: 10),),
          ),
          
          Container(
              padding: EdgeInsets.only(
                top: 10, left: 40, right: 40
              ),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: details.map((e) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                          Text(e.title),
                          e.type == 'debit' ? Text('- ${e.amount} NGN')
                          : Text('+ ${e.amount} NGN')
                     ],),
                     Text(e.desc, style: TextStyle(color: LightColor.grey)),
                     Divider()
                   ],
                )).toList()
              ),
          )
        ],
      ),
    );
  }
}