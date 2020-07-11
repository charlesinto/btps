



import 'package:btps/theme/app_color.dart';
import 'package:btps/theme/theme.dart';
import 'package:btps/util/appBack.dart';
import 'package:btps/widget/title_text.dart';
import 'package:flutter/material.dart';

import 'package:keyboard_avoider/keyboard_avoider.dart';

class ConfirmPinStageTwo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ConfirmPinStageTwoState();
}

class _ConfirmPinStageTwoState extends State<ConfirmPinStageTwo>{
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
          // padding: EdgeInsets.only(left: AppTheme.fullWidth(context) * 0.2),
          child: Row(
            children: <Widget>[
              AppBackArrow(onPress: (){}, color: LightColor.blue),
              Expanded(flex: 1, child: Center(
                child:Text('Reset PIN', style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.bold, fontSize: 18))
              ))
            ],
          )
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
  Widget dobContainer(BuildContext context){
    return Container(
      width: AppTheme.fullWidth(context),
      margin: EdgeInsets.symmetric(horizontal: 16),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TitleText(text: 'Date of Birth',),
          Container(
            width: AppTheme.fullWidth(context),
            child: TextField(
                decoration: InputDecoration(
                  hintText: '09-01-2020',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: LightColor.lightGrey)
                  ),
                  suffixIcon: Icon(Icons.calendar_today)
                ),
              ) ,)
        ],
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
              'Confirm new PIN',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 18,
              ),
            ),
          ],
        ),
      )
      );
  }
  
  
  Widget loginButton(BuildContext context){
    return Container(
      child: Center(
        child: RaisedButton(onPressed: (){},
          child: Text('Confirm', style: TextStyle(color: Colors.white),),
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
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                    SizedBox(height: 100,),
                    loginButton(context),
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

