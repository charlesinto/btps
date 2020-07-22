
import 'dart:async';
import 'dart:convert';

import 'package:btps/model/app_authuser.dart';
import 'package:btps/theme/app_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App{
  static Stream<FirebaseUser> onAuthStateChange(){
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    return _firebaseAuth.onAuthStateChanged;
  }
  static Future<Authuser> getUser() async{
    try{
      SharedPreferences _pref = await SharedPreferences.getInstance();
      var user = json.decode(_pref.getString('btps'));
      var authUser = Authuser(uid: null, isAuth: null, isOnboarded: null,
       emailAddress: user['email'], 
      phoneNumber: user['phoneNumber'], firstName: user['firstName'], lastName: user['lastName'], userid: user['userid']);
      return authUser;
    }catch(error){
      
      print(error);
      return null;
    }
  }
  static Future<bool> isUserOnboarded() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool isOnbaorded =false;
    if(_prefs.getString('isOnboard') != null){
      isOnbaorded = true;
    }
    return isOnbaorded;
  }
  static setIsOnboardedToTrue() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('isOnboard', 'true');
  }
  static setCurrentUser(String uid) async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    // var user = Authuser(uid: uid, isAuth: true, isOnboarded: true, emailAddress: "", phoneNumber: "");
    
    _prefs.setString('user', json.encode(''));
  }
  static removeUser() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.remove('user');
  }
  static isLoading(BuildContext context){
    return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          padding: EdgeInsets.symmetric(vertical:16.0, horizontal: 16.0),
          child: new Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            new CircularProgressIndicator(backgroundColor: Colors.red),
            Container(padding: EdgeInsets.symmetric(horizontal:16.0),
              child: new Text("Loading"),
            )
          ],
        ),),
      );
      });
  }
  static stopLoading(BuildContext context){
    return Navigator.pop(context);
  }
  static showActionSuccess(BuildContext context, {String message = "Action Performed successfully", Function onConfirm}){
    return Alert(
          context: context,
          type: AlertType.success,
          title: "Action Successful",
          desc: message,
          buttons: [
            DialogButton(
              color: LightColor.primary,
              child: Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: (){
                Navigator.pop(context);
                onConfirm(context);
              },
              width: 120,
            ),
          ],
        ).show();
  }
  static showActionError(BuildContext context, {String message = "Action could not be performed", Function onConfirm}){
    return Alert(
          context: context,
          type: AlertType.error,
          title: "Action Error",
          desc: message,
          buttons: [
            DialogButton(
              color: LightColor.primary,
              child: Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: (){
                Navigator.pop(context);
                onConfirm(context);
              },
              width: 120,
            ),
          ],
        ).show();
  }
  static showConfirmDialog(BuildContext context,String title, String message, Function onConfirm, {int parmas}){
    return Alert(
          context: context,
          type: AlertType.info,
          title: title,
          desc: message,
          buttons: [
            DialogButton(
              color: LightColor.primary,
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: (){
                Navigator.pop(context);
              },
              width: 120,
            ),
            DialogButton(
              color: LightColor.red,
              child: Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: (){
                Navigator.pop(context);
                onConfirm(parmas);
              },
              width: 120,
            ),
          ],
        ).show();
  }
  static showCustomConfirmDialog(BuildContext context,String title, String message, Function onConfirm, {dynamic parmas}){
    return Alert(
          context: context,
          type: AlertType.info,
          title: title,
          desc: message,
          buttons: [
            DialogButton(
              color: Colors.white,
              child: Text(
                "Cancel",
                style: TextStyle(color: LightColor.red, fontSize: 20),
              ),
              onPressed: (){
                Navigator.pop(context);
              },
              width: 120,
            ),
            DialogButton(
              color: LightColor.red,
              child: Text(
                "Confirm",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: (){
                Navigator.pop(context);
                onConfirm(context, state: parmas);
              },
              width: 120,
            ),
          ],
        ).show();
  }
  
  

  static logOut(BuildContext context){
    FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;
    _fireBaseAuth.signOut();
  }
  

  static String formatAsMoney(int price ){
    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: price.toDouble());
    return fmf.output.withoutFractionDigits;
  }
}

/*

Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TitleText(text: 'Driver Location'),
          SizedBox(height: 8,),
          Text(address, style: TextStyle(fontSize: 12),)
        ],
      )

*/