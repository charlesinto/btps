



import 'package:btps/theme/app_color.dart';
import 'package:btps/theme/theme.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:keyboard_avoider/keyboard_avoider.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final ScrollController _scrollController = ScrollController();
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
  Widget imageContainer(BuildContext context){
    return Container(
      width: AppTheme.fullWidth(context),
      child: Center(
        child: Container(
          margin: EdgeInsets.only(
            left: AppTheme.fullWidth(context) * 0.1
          ),
          // padding: EdgeInsets.only(left: AppTheme.fullWidth(context) * 0.2),
          child: Image.asset('assets/logo.png', width: 184, height: 184, fit: BoxFit.contain,),
        ),
      )
    );
  }
  Widget inputContainer(BuildContext context){
    return Container(
      width: AppTheme.fullWidth(context),
      child:SizedBox(
        width: 400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // padding: EdgeInsets.only(left: AppTheme.fullWidth(context) * 0.2),
          children: <Widget>[
            Container(
              width: 40,
              child: TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: LightColor.black)
                  )
                ),
              )
            ),
            SizedBox(width: 10,),
            Container(
              width: 40,
              child: TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: LightColor.black)
                  )
                ),
              )
            ),
            SizedBox(width: 10,),
            Container(
              width: 40,
              child: TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: LightColor.black)
                  )
                ),
              )
            ),
            SizedBox(width: 10,),
            Container(
              width: 40,
              child: TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: LightColor.black)
                  )
                ),
              )
            ),
            SizedBox(width: 10,),
            Container(
              width: 40,
              child: TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: LightColor.black)
                  )
                ),
              )
            ),
          ]
        ),

      )
    );
  }
  Widget textContainer(BuildContext context){
    return Container(
      child: Container(
        width: AppTheme.fullWidth(context),
        child: Column(
          children: <Widget>[
            Text(
              'Enter your Login Pin',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      )
      );
  }
  Widget smallCircle(BuildContext context){
    return Positioned(

      top: 20,
      left: 0,
      // left: AppTheme.fullWidth(context) * 0.5,
      child: Container(
        width: AppTheme.fullWidth(context),
        height: 40,
        child: CustomPaint(
          painter: DrawCircle(
            color: Colors.white,
            radius: 10,
            offset: Offset(AppTheme.fullWidth(context) / 2, 20)
          ),
        ),
      ));
  }
  Widget bigCircle(BuildContext context){
    return Positioned(

      top: 100,
      left: 0,
      // left: AppTheme.fullWidth(context) * 0.5,
      child: Container(
        width: AppTheme.fullWidth(context),
        height: 60,
        child: CustomPaint(
          painter: DrawCircle(
            color: Color(0xff90CFF6),
            radius: 30,
            offset: Offset(AppTheme.fullWidth(context) * 0.2, 20)
          ),
        ),
      ));
  }
  Widget loginButton(BuildContext context){
    return Container(
      child: Center(
        child: RaisedButton(onPressed: (){},
          child: Text('Login', style: TextStyle(color: Colors.white),),
          color: Color(0xff006FB4),
          padding: EdgeInsets.symmetric(horizontal: 100.0),
        )
      )
      );
  }
  Widget forgotButton(BuildContext context){
    return Container(
      child: Center(
        child: OutlineButton(onPressed: (){},
        borderSide: BorderSide(
          color: Color(0xff006FB4)
        ),
          child: Text('Forgot your Pin?', style: TextStyle(color: Colors.black),),
          // color: ,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
        )
      )
      );
  }
  @override
  Widget build(BuildContext context) {
    print('called');
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: AppTheme.fullWidth(context),
          height: AppTheme.fullHeight(context),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/bg2.png'),
            fit: BoxFit.cover)
          ),
          // 
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child:KeyboardAvoider(
                  autoScroll: true,
                  child: ListView(
                    controller: _scrollController,
                    children: <Widget>[
                    imageContainer(context),
                    SizedBox(height: 16,),
                    textContainer(context),
                    SizedBox(height: 40,),
                    inputContainer(context),
                    SizedBox(height: 40,),
                    loginButton(context),
                    SizedBox(height: 40,),
                    forgotButton(context)
                    ],
                  )),
            ),
          )
        )),
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

class DrawCircle extends CustomPainter{
  final double radius;
  final Color color;
  Offset offset;
  DrawCircle({this.radius, this.color, this.offset});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color;
    var center = offset;
    canvas.drawCircle(center, radius, paint);

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}