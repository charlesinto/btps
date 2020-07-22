

import 'dart:convert';

import 'package:btps/model/appState.dart';
import 'package:shared_preferences/shared_preferences.dart';


AppState reducer(AppState prevState, dynamic action){
  
  AppState newState = AppState.fromAppState(prevState);

  
  return newState;
}