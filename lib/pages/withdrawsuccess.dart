
import 'package:btps/theme/app_color.dart';
import 'package:btps/theme/theme.dart';
import 'package:btps/widget/darwer.dart';
import 'package:btps/widget/title_text.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class WithdrawPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage>{
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
    return Scaffold(
      drawer: DrawerNavigation(),
      body:SafeArea(
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
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        TitleText(text: 'Withdraw Successful',
                          fontSize: 16,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Image.asset('assets/success.png', width: 100, height: 100, fit: BoxFit.contain,),
                        SizedBox(
                          height: 100,
                        ),
                        loginButton(context)
                      ],
                    )),
              ),
            )
          ))
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



