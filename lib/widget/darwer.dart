
import 'package:btps/theme/app_color.dart';
import 'package:btps/util/app.dart';
import 'package:btps/widget/title_text.dart';
import 'package:flutter/material.dart';

class DrawerNavigation extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Container(
        
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 16),
              height: 200,
              width: double.infinity,
              color: Color(0xff2A97DB) ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 48,
                    height: 48,

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/profilepic.png'),
                        fit: BoxFit.contain
                      ),
                      borderRadius: BorderRadius.circular(24)
                    ),
                      
                  ),
                   TitleText(
                      text: 'John Doe',
                      color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold,),
                      SizedBox(height: 2,),
                      Text('User ID: 20641', style: TextStyle(color: Colors.white, fontSize: 10))
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 16, top: 24),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.of(context).pushReplacementNamed('/home');
                      },
                      child: Container(
                        width: double.infinity,
                        color: LightColor.whiteWithOpacity,
                        child: Row(children: <Widget>[
                          Image.asset('assets/home.png', width: 24, height: 24, fit: BoxFit.contain,),
                          SizedBox(width: 16,),
                          Text('Home')
                        ],),
                      ),),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){},
                      child: Container(
                        width: double.infinity,
                        color: LightColor.whiteWithOpacity,
                        child: Row(children: <Widget>[
                          Image.asset('assets/user2.png', width: 24, height: 24, fit: BoxFit.contain,),
                          SizedBox(width: 16,),
                          Text('Profile')
                        ],),
                      ),),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){},
                      child: Container(
                        width: double.infinity,
                        color: LightColor.whiteWithOpacity,
                        child: Row(children: <Widget>[
                          Image.asset('assets/contact-us.png', width: 24, height: 24, fit: BoxFit.contain,),
                          SizedBox(width: 16,),
                          Text('Contact Us')
                        ],),
                      ),),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          App.logOut(context);
                        },
                      child: Container(
                        width: double.infinity,
                        color: LightColor.whiteWithOpacity,
                        child: Row(children: <Widget>[
                          Image.asset('assets/exit.png', width: 24, height: 24, fit: BoxFit.contain,),
                          SizedBox(width: 16,),
                          Text('Log Out')
                        ],),
                      ),),
                      SizedBox(height: 20,)
                  ],
                ),
              ) 
            )
          ],
        ),
      ),
    );
  }
}