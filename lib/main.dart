import 'package:btps/config/route.dart';
import 'package:btps/model/appState.dart';
import 'package:btps/pages/home.dart';
import 'package:btps/pages/login.dart';
import 'package:btps/pages/mainPage.dart';
import 'package:btps/pages/onboarding.dart';
import 'package:btps/theme/theme.dart';
import 'package:btps/util/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redux/redux.dart';
import 'package:btps/redux/reducers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Stream<FirebaseUser> _onAuthStateChange(){
    return App.onAuthStateChange();
  }
  Future<bool> isUserOnboarded() async{
    // SharedPreferences _pref = await SharedPreferences.getInstance();
    // _pref.remove('isOnboard');
    return await App.isUserOnboarded();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _onAuthStateChange(),
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot ){
          if(snapshot.connectionState != ConnectionState.done){
            if(snapshot.data != null){
              return StoreProvider(
                store: Store<AppState>(reducer, initialState: AppState()), 
                child: MaterialApp(
                  title: 'Flutter Demo',
                  theme: AppTheme.lightTheme.copyWith(
                      textTheme: GoogleFonts.muliTextTheme(
                        Theme.of(context).textTheme
                      ),
                  ),
                  home: HomePage(),
                  routes: Routes.getRoute(),
                )
              );
            }
            return FutureBuilder(
            future: isUserOnboarded(),
            builder: (BuildContext context,AsyncSnapshot<bool> snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.data == true){
                  return StoreProvider<AppState>(
                    store: Store<AppState>(reducer, initialState: AppState()),
                    child: MaterialApp(
                      title: 'BTPS',
                      theme: AppTheme.lightTheme.copyWith(
                                                  textTheme: GoogleFonts.muliTextTheme(
                                                    Theme.of(context).textTheme,
                                                  ),
                                                ),
                      home: LoginPage(),
                      routes: Routes.getRoute(),
                    ),
                  );
                }
               print('not onbarded');
               return StoreProvider<AppState>(
                    store: Store<AppState>(reducer, initialState: AppState()),
                    child: MaterialApp(
                      title: 'BTPS',
                      theme: AppTheme.lightTheme.copyWith(
                                                  textTheme: GoogleFonts.muliTextTheme(
                                                    Theme.of(context).textTheme,
                                                  ),
                                                ),
                      home: OnBoardingPage(),
                      routes: Routes.getRoute(),
                    ),
                  );
              }
              return Container();
            },
          );
        
          }
          return Container();
      });
    // MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: AppTheme.lightTheme.copyWith(
    //       textTheme: GoogleFonts.muliTextTheme(
    //         Theme.of(context).textTheme
    //       ),
    //   ),
    //   home: MainPage(),
    //   routes: Routes.getRoute(),
    // );
  }
}


