



import 'package:btps/theme/app_color.dart';
import 'package:btps/theme/theme.dart';
import 'package:btps/util/darwer.dart';
import 'package:btps/widget/title_text.dart';
import 'package:flutter/material.dart';

import 'package:keyboard_avoider/keyboard_avoider.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
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
      child: Container(
          height: 173,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            gradient: LinearGradient(
              
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xff549ECC), Color(0xff61B5EC)])
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Text('Your Wallet', style: TextStyle(color: Colors.white),),
                Text('Jun 30, 2020', style: TextStyle(color: Colors.white),)
              ],),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TitleText(
                      text: 'John Doe',
                      color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold,),
                      SizedBox(height: 2,),
                      Text('User ID: 20641', style: TextStyle(color: Colors.white, fontSize: 10))
                  ],
                ),
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/profilepic.png', ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(32.5)
                  ),
                )
              ],),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text('Balance', style: TextStyle(color: Colors.white, fontSize: 10),),
                SizedBox(width: 5,),
                Text('NGN 500', style: TextStyle(color: Colors.white, fontSize:22,  ),)
              ],)
            ],
          )
        )
    );
  }
  Widget inputContainer(BuildContext context){
    return Container(
      width: AppTheme.fullWidth(context),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppTheme.iconShadow,
        borderRadius: BorderRadius.circular(4.0)
      ),
      
      height: AppTheme.fullHeight(context),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text('Recent Bus Fares', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 9
            ),),
            Text('View All',style: TextStyle(
              color: Color(0xff2A97DB),
              fontSize: 9
            ))
          ],),
          ),
          Divider(),
          SizedBox(
            height: 300,
            child: GridView.count(
              crossAxisCount: 3,
              children: <Widget>[
                credit('Fare refund'),
                debit('Debit from Wallet'),
                debit('Fare refund'),
                credit('Fare refund'),
                credit('Fare refund'),
                credit('Fare refund')

              ],
              
            ),
          )
        ],
      ),
    );
  }
  Widget credit(String text){
    return Container(
      child: Column(
        children: <Widget>[
            CircleAvatar(
              child: Text('C', style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold
              ),),
              
            ),
            SizedBox(
              height: 10,
            ),
            Text(text, style: TextStyle(fontSize: 9),
            textAlign: TextAlign.center,)
        ],
      ),
    );
  }
  Widget debit(String text){
    return Container(
      child: Column(
        children: <Widget>[
            CircleAvatar(
              child: Text('D', style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold
              ),)
            ),
            SizedBox(
              height: 10,
            ),
            Text(text, style: TextStyle(fontSize: 9),
            textAlign: TextAlign.center,)
        ],
      ),
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
        child: SizedBox(
          height: 260,
          child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: <Widget>[
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: AppTheme.iconShadow
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/withdraw.png', width: 48, height: 48, fit: BoxFit.contain,),
                    SizedBox(height: 8,),
                    Text('Withdraw', style: TextStyle(fontSize: 9))
                  ],
                )
            ),
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: AppTheme.iconShadow
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/savings.png', width: 48, height: 48, fit: BoxFit.contain,),
                    SizedBox(height: 8,),
                    Text('Fund Wallet', style: TextStyle(fontSize: 9),)
                  ],
                )
              
            ),
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: AppTheme.iconShadow
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/fund.png', width: 48, height: 48, fit: BoxFit.contain,),
                    SizedBox(height: 8,),
                    Text('Auto Top up', style: TextStyle(fontSize: 9))
                  ],
                )
            ),
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: AppTheme.iconShadow
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/payment.png', width: 48, height: 48, fit: BoxFit.contain,),
                    SizedBox(height: 8,),
                    Text('Transactions', style: TextStyle(fontSize: 9))
                  ],
                )
            ),
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: AppTheme.iconShadow
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/complaint.png', width: 48, height: 48, fit: BoxFit.contain,),
                    SizedBox(height: 8,),
                    Text('Report Lost Card', style: TextStyle(fontSize: 9))
                  ],
                )
            ),
            Container(

              height: 100,
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.white,
                boxShadow: AppTheme.iconShadow
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/user.png', width: 48, height: 48, fit: BoxFit.contain,),
                    SizedBox(height: 8,),
                    Text('Settings', style: TextStyle(fontSize: 9))
                  ],
                )
            ),
          ],
        ),
        ),
      )
      );
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
      
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Home', style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
        // backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black)
      ),
      drawer: DrawerNavigation(),
      body: SafeArea(
        child: Container(
          width: AppTheme.fullWidth(context),
          height: AppTheme.fullHeight(context),
          padding: EdgeInsets.only(left: 8.0,right: 8.0, top: 16.0),
          decoration: BoxDecoration(
            color: Color(0xfff9f9f9)
          ),
          // 
          child: Container(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child:KeyboardAvoider(
                  autoScroll: true,
                  child: ListView(
                    controller: _scrollController,
                    children: <Widget>[
                    imageContainer(context),
                    SizedBox(height: 20,),
                    textContainer(context),
                    SizedBox(height: 20,),
                    inputContainer(context)
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

