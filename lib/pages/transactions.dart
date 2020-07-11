
import 'package:btps/model/appTransaction.dart';
import 'package:btps/model/transactDetail.dart';
import 'package:btps/theme/app_color.dart';
import 'package:btps/theme/theme.dart';
import 'package:btps/util/darwer.dart';
import 'package:btps/util/transaction.dart';
import 'package:flutter/material.dart';

class TransactionListPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TransactionListPageState();
}

class _TransactionListPageState extends State<TransactionListPage>{
  String dropdownValue;
  List<AppTransaction> incoming = [
      AppTransaction(date: '2020-09-01', 
      detail: [
        TransactionDetail(title: 'Fare payment', 
        desc: ' BRT wallet 12:30PM', amount: '700', type: 'credit'),
        TransactionDetail(title: 'Fare payment', 
        desc: ' BRT wallet 12:30PM', amount: '700', type: 'credit'),
        TransactionDetail(title: 'Fare payment', 
        desc: ' BRT wallet 12:30PM', amount: '700', type: 'credit')
      ]),
      AppTransaction(date: '2020-09-01', 
      detail: [
        TransactionDetail(title: 'Fare payment', 
        desc: ' BRT wallet 12:30PM', amount: '700', type: 'credit'),
        TransactionDetail(title: 'Fare payment', 
        desc: ' BRT wallet 12:30PM', amount: '700', type: 'credit'),
        TransactionDetail(title: 'Fare payment', 
        desc: ' BRT wallet 12:30PM', amount: '700', type: 'credit')
      ]),
      AppTransaction(date: '2020-09-01', 
      detail: [
        TransactionDetail(title: 'Fare payment', 
        desc: ' BRT wallet 12:30PM', amount: '700', type: 'credit'),
        TransactionDetail(title: 'Fare payment', 
        desc: ' BRT wallet 12:30PM', amount: '700', type: 'credit'),
        TransactionDetail(title: 'Fare payment', 
        desc: ' BRT wallet 12:30PM', amount: '700', type: 'credit')
      ]),
      AppTransaction(date: '2020-09-01', 
      detail: [
        TransactionDetail(title: 'Fare payment', 
        desc: ' BRT wallet 12:30PM', amount: '700', type: 'credit'),
        TransactionDetail(title: 'Fare payment', 
        desc: ' BRT wallet 12:30PM', amount: '700', type: 'credit'),
        TransactionDetail(title: 'Fare payment', 
        desc: ' BRT wallet 12:30PM', amount: '700', type: 'credit')
      ]),
      AppTransaction(date: '2020-09-01', 
      detail: [
        TransactionDetail(title: 'Fare payment', 
        desc: ' BRT wallet 12:30PM', amount: '700', type: 'credit'),
        TransactionDetail(title: 'Fare payment', 
        desc: ' BRT wallet 12:30PM', amount: '700', type: 'credit'),
        TransactionDetail(title: 'Fare payment', 
        desc: ' BRT wallet 12:30PM', amount: '700', type: 'credit')
      ])
  ];
  List<AppTransaction> outgoing = [
      AppTransaction(date: '2020-09-01', 
      detail: [
        TransactionDetail(title: 'Fare payment', 
        desc: ' BRT wallet 12:30PM', amount: '700', type: 'debit')
      ]),
      AppTransaction(date: '2020-09-01', 
      detail: [
        TransactionDetail(title: 'Fare payment', 
        desc: ' BRT wallet 12:30PM', amount: '700', type: 'debit')
      ]),
      AppTransaction(date: '2020-09-01', 
      detail: [
        TransactionDetail(title: 'Fare payment', 
        desc: ' BRT wallet 12:30PM', amount: '700', type: 'debit')
      ]),
      AppTransaction(date: '2020-09-01', 
      detail: [
        TransactionDetail(title: 'Fare payment', 
        desc: ' BRT wallet 12:30PM', amount: '700', type: 'debit')
      ]),
      AppTransaction(date: '2020-09-01', 
      detail: [
        TransactionDetail(title: 'Fare payment', 
        desc: ' BRT wallet 12:30PM', amount: '700', type: 'debit')
      ]),
      AppTransaction(date: '2020-09-01', 
      detail: [
        TransactionDetail(title: 'Fare payment', 
        desc: ' BRT wallet 12:30PM', amount: '700', type: 'debit')
      ])
  ];
  bool isSwitched = false;
  Widget blueContainer(BuildContext context){
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
      
      height: AppTheme.fullHeight(context) * 0.25,
      width: AppTheme.fullWidth(context),
      color: Colors.white,
      child: CustomPaint(
        painter: CustombgPaint(),
      ),
    ));
  }

  
  
  Widget loginButton(BuildContext context){
    return Container(
      child: Center(
        child: RaisedButton(onPressed: (){},
          child: Text('Next', style: TextStyle(color: Colors.white),),
          color: Color(0xff006FB4),
          padding: EdgeInsets.symmetric(horizontal: 100.0),
        )
      )
      );
  }
 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,

        child: Scaffold(
          drawer: DrawerNavigation(),
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text('Transactions', style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
            // backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            
            bottom: TabBar(
              tabs: [
                Tab(text: 'Incoming',) ,
                Tab(text: 'Outgoing'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 500),
                    child: SizedBox(
                      height: AppTheme.fullHeight(context) - 150,
                      child: ListView.builder(

                      itemCount: incoming.length ,
                      itemBuilder: (BuildContext context, int index){
                            return TransactionPage(date: incoming[index].date, details: incoming[index].detail,);
                      }),
                    )
                ),
              SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 500),
                    child: SizedBox(
                      height: AppTheme.fullHeight(context) - 150,
                      child: ListView.builder(

                      itemCount: incoming.length ,
                      itemBuilder: (BuildContext context, int index){
                            return TransactionPage(date: outgoing[index].date, details: outgoing[index].detail,);
                      }),
                    )
                )
            ],
          ),
        ),
      );
  
  }
  
 

  
}

class CustombgPaint extends CustomPainter{
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = LightColor.blue;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.1, size.width  , size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}



