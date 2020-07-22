

import 'package:btps/pages/onboarding/screenOne.dart';
import 'package:btps/pages/onboarding/screenThree.dart';
import 'package:btps/pages/onboarding/screenTwo.dart';
import 'package:btps/theme/app_color.dart';
import 'package:btps/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';

class OnBoardingPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _OnBoardingPageState();
}


class _OnBoardingPageState extends State<OnBoardingPage>{
  List<Widget> pages = [
    ScreenOne(), ScreenTwo(), ScreenThree()
  ];
  int index = 0;
  void _handleLeftSwipe(){
    if(index == 0){
      return;
    }
    setState(() {
      index = index - 1;
    });

  }
  void _hanldeRightSwipe(){
    if(index == 2){
      return;
    }
    setState(() {
      index = index + 1;
    });
  }
  Color setBgColor(int page){
    return page == index ? LightColor.primary : LightColor.grey;
  }
  void _navigateToNextSlide(int slide){
    setState(() {
      index = slide;
    });
  }
    Widget swiperStagerIndicator(BuildContext context){
    return Positioned(
                  bottom: 100,
                  child: Container(
                    
                    width: AppTheme.fullWidth(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => _navigateToNextSlide(0),
                          child: CircleAvatar(
                            
                            radius: 7.5,
                            backgroundColor: setBgColor(0),
                          ),
                        ),
                        SizedBox(width: 6,),
                        GestureDetector(
                          onTap: () => _navigateToNextSlide(1),
                          child: CircleAvatar(
                            radius: 7.5,
                            backgroundColor: setBgColor(1),
                          ),
                        ),
                        SizedBox(width: 6,),
                        GestureDetector(
                          onTap: () => _navigateToNextSlide(2),
                          child: CircleAvatar(
                            radius: 7.5,
                            backgroundColor: setBgColor(2),
                          ),
                        ),
                      ],
                    )
                  ) 
          );
  }
   Widget loginButton(BuildContext context){
    return Positioned(
      bottom: 20,
      child: Container(
        width: AppTheme.fullWidth(context),
      child: Center(
        child: RaisedButton(onPressed: (){
          Navigator.of(context).pushNamed('/login');
        },
          child: Text('Get Started', style: TextStyle(color: Colors.white),),
          color: Color(0xff006FB4),
          padding: EdgeInsets.symmetric(horizontal: 60.0),
        )
      )
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(children: <Widget>[
          SwipeDetector(
                  onSwipeLeft: _handleLeftSwipe,
                  onSwipeRight: _hanldeRightSwipe,
                  child: Container(
                  height: AppTheme.fullHeight(context),
                  width: AppTheme.fullWidth(context),
                )),
          pages[index],
          swiperStagerIndicator(context),
          loginButton(context)
        ],),
      ),);
  }

}