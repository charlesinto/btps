



import 'package:btps/theme/app_color.dart';
import 'package:btps/theme/theme.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ScreenOne extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne>{
  Widget blueContainer(BuildContext context){
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
      
      height: AppTheme.fullHeight(context) * 0.62,
      width: AppTheme.fullWidth(context),
      color: Colors.white,
      child: CustomPaint(
        painter: CustombgPaint(),
      ),
    ));
  }
  Widget imageContainer(BuildContext context){
    return Positioned(
      top: AppTheme.fullHeight(context) * 0.1,
      left: AppTheme.fullWidth(context) * 0.1,
      child: Container(
        width: AppTheme.fullWidth(context),
        child: Container(
          margin: EdgeInsets.only(
            left: AppTheme.fullWidth(context) * 0.1
          ),
          // padding: EdgeInsets.only(left: AppTheme.fullWidth(context) * 0.2),
          child: Image.asset('assets/bus.png', width: 350, height: 350, fit: BoxFit.cover,),
        ),
      )
    );
  }
  Widget textContainer(BuildContext context){
    return Positioned(
      top: AppTheme.fullHeight(context) * 0.52 + 30,
      left: 0,
      child: Container(
        width: AppTheme.fullWidth(context),
        child: Column(
          children: <Widget>[
            Text(
              'Ride In Comfort',
              style: TextStyle(
                fontFamily: 'Ultra',
                fontSize: 27,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Lorem ipsum dolor sit amet, consetetur \n sadipscing elitr, sed diam nonumy eirmod \ntempor invidunt ut labore et dolore magna',
             style: TextStyle(
               fontFamily: 'Raleway',
               fontSize: 12,
               height: 1.5
               
             ),)
          ],
        ),
      ));
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
  Widget bottomBox(BuildContext context){
    return Positioned(

      bottom: 0,
      right: - 20,
      // left: AppTheme.fullWidth(context) * 0.5,
      child: Container(
        // width: AppTheme.fullWidth(context),
        // color:Color(0xff90CFF6) ,
        margin: EdgeInsets.only(left: 110),
        child: Transform.rotate(angle:  math.pi / 6,
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Color(0xff90CFF6),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              bottomLeft: Radius.circular(40)
            )
          ),
        ),
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
          child: Stack(children: <Widget>[
            Container(
              color: Colors.white,
              width: AppTheme.fullWidth(context),
              height: AppTheme.fullHeight(context) ,),
              blueContainer(context),
              imageContainer(context),
              textContainer(context),
              smallCircle(context),
              bigCircle(context),
              bottomBox(context)
          ],)
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

    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.3, size.height, size.width , size.height * 0.5);
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