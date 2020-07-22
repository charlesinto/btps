



import 'dart:convert';

import 'package:btps/theme/app_color.dart';
import 'package:btps/theme/theme.dart';
import 'package:btps/util/app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final ScrollController _scrollController = ScrollController();
  FocusNode _controller1 = new FocusNode();
  Firestore _firestore = Firestore.instance;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
  FocusNode _controller2 = new FocusNode();
  FocusNode _controller3 = new FocusNode();
  FocusNode _controller4 = new FocusNode();
  FocusNode _controller5 = new FocusNode();
  String _text1 = '';
  String _text2 = '';
  String _text3 = '';
  String _text4 = '';
  String _text5 = '';
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
                autofocus: true,
                focusNode: _controller1,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: LightColor.black)
                  )
                ),
                onChanged: (value){
                  setState(() {
                    _text1 = value;
                  });
                  if(value.isNotEmpty && value.length == 1){
                    FocusScope.of(context).requestFocus(_controller2);
                  }
                },
              )
            ),
            SizedBox(width: 10,),
            Container(
              width: 40,
              child: TextField(
                focusNode: _controller2,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: LightColor.black)
                  )
                ),
                onChanged: (value){
                  setState(() {
                    _text2 = value;
                  });
                  if(value.isNotEmpty && value.length == 1){
                    FocusScope.of(context).requestFocus(_controller3);
                  }
                },
              )
            ),
            SizedBox(width: 10,),
            Container(
              width: 40,
              child: TextField(
                focusNode: _controller3,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: LightColor.black)
                  )
                ),
                onChanged: (value){
                  setState(() {
                    _text3 = value;
                  });
                  if(value.isNotEmpty && value.length == 1){
                    FocusScope.of(context).requestFocus(_controller4);
                  }
                },
              ),
              
            ),
            SizedBox(width: 10,),
            Container(
              width: 40,
              child: TextField(
                focusNode: _controller4,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: LightColor.black)
                  )
                ),
                onChanged: (value){
                  setState(() {
                    _text4 = value;
                  });
                  if(value.isNotEmpty && value.length == 1){
                    FocusScope.of(context).requestFocus(_controller5);
                  }
                },
              )
            ),
            SizedBox(width: 10,),
            Container(
              width: 40,
              child: TextField(
                focusNode: _controller5,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: LightColor.black)
                  )
                ),
                onChanged: (value){
                  setState(() {
                    _text5 = value;
                  });
                  if(value.isNotEmpty && value.length == 1){
                    // FocusScope.of(context).requestFocus(_controller3);
                  }
                },
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
        child: RaisedButton(onPressed: (){
          loginUser(context);
        },
          child: Text('Login', style: TextStyle(color: Colors.white),),
          color: Color(0xff006FB4),
          padding: EdgeInsets.symmetric(horizontal: 100.0),
        )
      )
      );
  }
  loginUser(BuildContext context) async{
    try{
      SharedPreferences _preferences = await SharedPreferences.getInstance();
      App.isLoading(context);
      var userid = '$_text1$_text2$_text3$_text4$_text5';
      var docs = await _firestore.collection('users').where('userid', isEqualTo: userid).getDocuments();

      if(docs.documents.isEmpty){
        App.stopLoading(context);
        return App.showActionError(context, message: 'User Account not setup, please visit any of our service centers');
      }
      _firebaseAuth.signInAnonymously();
      App.stopLoading(context);
      _preferences.setString('btps', json.encode({
          'firstName': docs.documents[0].data['firstName'],
          'lastName': docs.documents[0].data['lastName'],
          'email': docs.documents[0].data['email'],
          'phoneNumber': docs.documents[0].data['phoneNumber'],
          'userid': docs.documents[0].data['userid']
      }));
      // App.stopLoading(context);
      
      
    }catch(error){
      print(error);
      App.stopLoading(context);
    }

    
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