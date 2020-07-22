
import 'package:flutter/material.dart';

class Authuser{
  final String uid;
  bool isAuth = false;
  bool isOnboarded = false;
  String emailAddress = "";
  String firstName = "";
  String lastName = "";
  String phoneNumber = "";
  String userid = "";
  Authuser({@required this.uid, @required this.isAuth, @required this.isOnboarded, @required this.emailAddress, @required this.phoneNumber, @required this.firstName, @required this.lastName, @required this.userid});

  Map<String, dynamic> toJson(){
    return <String, dynamic>{'uid': uid, 'isAuth': isAuth, 'isOnboarded': isOnboarded, emailAddress: emailAddress, phoneNumber: phoneNumber};
  }
}