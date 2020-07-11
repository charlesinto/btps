

import 'package:btps/pages/mainPage.dart';
import 'package:flutter/material.dart';

class Routes{
  static Map<String,WidgetBuilder> getRoute(){
    return  <String, WidgetBuilder>{

          '/home': (_) => MainPage(),
      };
  }
}