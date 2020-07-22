
import 'package:btps/theme/app_color.dart';
import 'package:btps/theme/theme.dart';
import 'package:btps/widget/darwer.dart';
import 'package:flutter/material.dart';

class ConfirmPinPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ConfirmPinPageState();
}

class _ConfirmPinPageState extends State<ConfirmPinPage>{
  String dropdownValue;
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
    print('called');
    // TODO: implement build
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Withdraw', style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
        // backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black)
      ),
      drawer: DrawerNavigation(),
      body: SafeArea(
        child: Container(
          width: AppTheme.fullWidth(context),
          height: AppTheme.fullHeight(context),
          padding: EdgeInsets.only( top: 16.0),
          decoration: BoxDecoration(
            color: Color(0xfff9f9f9)
          ),
          // 
          child: Container(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: Stack(
                children: <Widget>[
                    Container(
                      height: AppTheme.fullHeight(context),
                      width: AppTheme.fullWidth(context),
                    ),
                    pinContainer(context),
                    blueBackground(context),
                    keyPad(context)
                ],
              )
            ),
          )
        )),
    );
  }
  Widget numberPad(BuildContext context, String number, { Function onPressed}){
    return FlatButton(
                    onPressed: () => onPressed(),
                    child: Text(number, style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      color: Color(0xff7C7C7C)
                    )),
                  );
  }
  Widget keyPad(BuildContext context){
    return Positioned(
      top: 100,
      left: 0,
      child: Container(
        width: AppTheme.fullWidth(context),
        height: 300,
        margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Container(
          margin: EdgeInsets.only(right: 40, ) ,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
            boxShadow: AppTheme.iconShadow
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  numberPad(context, '1', onPressed: (){}),
                  numberPad(context, '2', onPressed: (){}),
                  numberPad(context, '3', onPressed: (){})
                ],)
              ),
              SizedBox(height: 30,),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  numberPad(context, '4', onPressed: (){}),
                  numberPad(context, '5', onPressed: (){}),
                  numberPad(context, '6', onPressed: (){})
                ],)
              ),
              SizedBox(height: 30,),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  numberPad(context, '7', onPressed: (){}),
                  numberPad(context, '8', onPressed: (){}),
                  numberPad(context, '9', onPressed: (){})
                ],)
              ),
              SizedBox(height: 30,),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  numberPad(context, '', onPressed: (){}),
                  numberPad(context, '0', onPressed: (){}),
                  GestureDetector(
                    onTap: (){ print('delete');},
                    child: Container(
                      width: 60,
                      height: 40,
                    decoration: BoxDecoration(
                      color: LightColor.primary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(60, 60),
                          bottomLeft: Radius.elliptical(60, 60)
                      )
                    ),
                    child: Center(
                      child: Text('X', style: TextStyle(
                      color: Colors.white, fontSize: 14)) ,),
                  ),
                  )
                ],)
              )
            ],
          ),
        ),
      ));
  }
  Widget blueBackground(BuildContext context){
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        width: AppTheme.fullWidth(context),
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: LightColor.primaryLight,
        ),
      ));
  }
  Widget pinContainer(context){
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 20, 
        ),
        width: AppTheme.fullWidth(context),
        child: Container(
          width: double.infinity,
          child: Column(children: <Widget>[
            Text('Enter PIN to confirm'),
            SizedBox(height: 40,),
            SizedBox(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                filledBox(context),
                unfilledBox(context),
                unfilledBox(context),
                unfilledBox(context)
              ],),
            )
          ],),
        )
      ));
  }
  Widget filledBox(BuildContext context){
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: LightColor.primary,
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
  Widget unfilledBox(BuildContext context){
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Color(0xffECECEC),
        borderRadius: BorderRadius.circular(20)
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



