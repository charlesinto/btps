import 'package:btps/theme/app_color.dart';
import 'package:flutter/material.dart';



class AppTheme {
  const AppTheme();
  static ThemeData lightTheme = ThemeData(
    backgroundColor: LightColor.background,
    primaryColor: LightColor.blue,
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        // color: LightColor.blue,
        border: Border(bottom: BorderSide(
          color: LightColor.primary,
          width: 4
        ))
      ),
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.black
    ),
    cardTheme: CardTheme(color: LightColor.background),
    textTheme: TextTheme(display1: TextStyle(color: LightColor.black)),
    iconTheme: IconThemeData(color: LightColor.iconColor),
    accentColor: LightColor.blue,
    toggleableActiveColor: LightColor.blue,
    
    primaryColorLight: LightColor.blue,
    bottomAppBarColor: LightColor.background,
    dividerColor: LightColor.lightGrey,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      
      iconTheme: IconThemeData(
        color: Colors.black
      )
    ),
    primaryTextTheme: TextTheme(
      body1: TextStyle(color:LightColor.titleTextColor)
    )
  );

  static TextStyle titleStyle = const TextStyle(color: LightColor.titleTextColor, fontSize: 16);
  static TextStyle subTitleStyle = const TextStyle(color: LightColor.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);

  static List<BoxShadow> oldshadow =  <BoxShadow>[
    BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 15),
  ];
  
  static List<BoxShadow> shadow = <BoxShadow>[
                BoxShadow(
                  color: Color(0xff000029),
                  blurRadius: 15,
                  spreadRadius: 10,
                  offset: Offset(0, 6), // changes position of shadow
                ),
              ];
  
static List<BoxShadow> iconShadow = <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              // spreadRadius: 5,
              blurRadius: 2,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ];
  
  static EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets hPadding = const EdgeInsets.symmetric(horizontal: 10,);

  static double fullWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  static double fullHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
}