

import 'package:btps/pages/home.dart';
import 'package:btps/pages/login.dart';
import 'package:btps/pages/mainPage.dart';
import 'package:btps/pages/transactions.dart';
import 'package:flutter/material.dart';

class Routes{
  static Map<String,WidgetBuilder> getRoute(){
    return  <String, WidgetBuilder>{

          '/home': (_) => HomePage(),
          '/login': (_) => LoginPage(),
          '/transactions': (_) => TransactionListPage()
      };
  }
}