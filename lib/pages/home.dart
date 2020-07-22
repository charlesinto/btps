



import 'dart:io';

import 'package:btps/config/constants.dart';
import 'package:btps/model/app_authuser.dart';
import 'package:btps/theme/app_color.dart';
import 'package:btps/theme/theme.dart';
import 'package:btps/util/app.dart';
import 'package:btps/widget/darwer.dart';
import 'package:btps/widget/title_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  String dateSlug = '';
  @override
  void initState() {
    // TODO: implement initState
    PaystackPlugin.initialize(publicKey: Config.apiKey);
    super.initState();
    
  }
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Firestore _firestore = Firestore.instance;
  Charge charge = Charge();
  String transcation = "";
  bool _inProgress = false;
  String amoutToAdd = '';
  String _cardNumber;
  String _cvv;
  int _expiryMonth = 0;
  int _expiryYear = 0;
  String _addressString = "";
  static const paystack_backend_url = "https://infinite-peak-60063.herokuapp.com";
  _handleCheckout(BuildContext context,int totalAmount,) async {
    var user = await App.getUser();
    Charge charge = Charge()
      ..amount = totalAmount * 100 // In base currency
      ..email = user.emailAddress
      ..card = _getCardFromUI();

    
      charge.reference = _getReference();
    

    try {
      CheckoutResponse _cartResponse = await PaystackPlugin.checkout(
        context,
        method: CheckoutMethod.card,
        charge: charge,
        fullscreen: false,
        
      );
      
      print('Response = $_cartResponse');
      if(_cartResponse.message.toLowerCase() == 'success'){
        
        App.isLoading(context);
        DateTime today = new DateTime.now();
        dateSlug ="${today.year.toString()}-${today.month.toString().padLeft(2,'0')}-${today.day.toString().padLeft(2,'0')}";
        await _firestore.collection('transactions').add({
          'title': 'Wallet top-up',
          'desc':'Wallet Funded',
           'amount': int.parse(amoutToAdd),
           'type': 'credit',
           'date': dateSlug,
           'ref': _cartResponse.reference,
           'userid': user.userid,
           'createdAt': new DateTime.now().toString()
        });
        var doc = await _firestore.collection('users').where('userid', isEqualTo: user.userid).getDocuments();
        if(doc.documents.isEmpty){
          await _firestore.collection('users').add({
            'email': user.emailAddress,
            'userid': user.userid,
            'balance': amoutToAdd
          });
          
          App.stopLoading(context);
           App.showActionSuccess(context, message: 'Wallet Funded Successfully', onConfirm: () => Navigator.pop(context));
          return FocusScope.of(context).requestFocus(FocusNode());
        }
        var amount = doc.documents[0].data['balance'];
        var newBalance = amount + int.parse(amoutToAdd);
        await _firestore.document('/users/${doc.documents[0].documentID}').updateData({
          'balance': newBalance
        });
        App.stopLoading(context);
        App.showActionSuccess(context, message: 'Wallet Funded Successfully', onConfirm: () => Navigator.pop(context));
        return FocusScope.of(context).requestFocus(FocusNode());
      }
     
    } catch (e) {
     
      App.stopLoading(context);
      print(e);
      return ;
      // _showMessage("Check console for error");
      // throw e;
    }
  }

  PaymentCard _getCardFromUI() {
    // Using just the must-required parameters.
    return PaymentCard(
      number: _cardNumber,
      cvc: _cvv,
      expiryMonth: _expiryMonth,
      expiryYear: _expiryYear,
    );
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return '${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }
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
  Widget dateContainer(BuildContext context){
    DateTime today = new DateTime.now();
    var  dateSlug ="${today.year.toString()}-${today.month.toString().padLeft(2,'0')}-${today.day.toString().padLeft(2,'0')}";
    return Text('$dateSlug', style: TextStyle(color: Colors.white),);
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
                dateContainer(context)
              ],),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                getUser(context),
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
                // Text('NGN 500', style: TextStyle(color: Colors.white, fontSize:22,  ),)
                getUserBalance(context)
              ],)
            ],
          )
        )
    );
  }
  
  getUserBalance(context){
    return FutureBuilder(
      future: App.getUser(),
      builder: (BuildContext context, AsyncSnapshot<Authuser> snapsot){
          if(snapsot.connectionState == ConnectionState.done){
            return StreamBuilder(
              stream: _firestore.collection('users').where('userid', isEqualTo: snapsot.data.userid).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if(snapshot.connectionState != ConnectionState.waiting){
                        return  Text('NGN ${App.formatAsMoney(snapshot.data.documents[0].data['balance'])}', style: TextStyle(color: Colors.white, fontSize:22,  ),);
                    }
                    return Container();
              });
          }
          return Container();
      });
  }
  getUser(context){
    return FutureBuilder(
      future: App.getUser(),
      builder: (BuildContext context, AsyncSnapshot<Authuser> snapsot){
          if(snapsot.connectionState == ConnectionState.done){
            return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TitleText(
                      text: '${snapsot.data.firstName} ${snapsot.data.lastName}',
                      color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold,),
                      SizedBox(height: 2,),
                      Text('User ID: ${snapsot.data.userid}', style: TextStyle(color: Colors.white, fontSize: 10))
                  ],
                );
          }
          return Container();
      });
  }
  Widget inputContainer(BuildContext context){
    return Container(
      width: AppTheme.fullWidth(context),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppTheme.iconShadow,
        borderRadius: BorderRadius.circular(4.0)
      ),
      
      height: 300,
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
            height: 200,
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
  toggleModalBottomSheet(BuildContext context){
    return showModalBottomSheet<Null>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      context: context,
      isScrollControlled: true,
      isDismissible: false,
     builder: (BuildContext context){
        return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric( vertical: 16),
                child: TitleText(
                  text: 'Enter amount to fund',
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
                   Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value){
                    setState(() {
                      amoutToAdd = value;
                    });
                  },
                    decoration: InputDecoration(
                      
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: LightColor.black)
                      ),
                      hintText: 'NGN 0.00',
                      
                    ),
                  )
              ),

              SizedBox(height: 20),
              loginButton(context),
              SizedBox(height: 10),
              forgotButton(context),
              SizedBox(height: 20),
            ],
          ),
            ),
          );
     });
    
    
  }
  Widget loginButton(BuildContext context){
    return Container(
      child: Center(
        child: RaisedButton(onPressed: (){
          // FocusScope.of(context).requestFocus(FocusNode());
          if(amoutToAdd.isEmpty){
            return App.showActionError(context, message: 'Please enter an amount');
          }
          _handleCheckout(context, int.parse(amoutToAdd));
        },
          child: Text('Fund', style: TextStyle(color: Colors.white),),
          color: Color(0xff006FB4),
          padding: EdgeInsets.symmetric(horizontal: 100.0),
        )
      )
      );
  }
  /*
KeyboardAvoider(
              autoScroll: true,
              child: ListView(
                controller: _scrollController2,
              children: <Widget>[
                SizedBox(height: 20,),
                TitleText(
                  text: 'Enter amount to fund',
                  fontSize: 12,
                ),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  child:  TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: LightColor.black)
                      ),
                      hintText: 'NGN 0.00',
                      
                    ),
                  ),
                )
              ],
            ),
            )

  */
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
            GestureDetector(
              onTap: () => toggleModalBottomSheet(context),
              child: Container(
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
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/transactions');
              },
              child: Container(
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
  
  

  Widget forgotButton(BuildContext context){
    return Container(
      child: Center(
        child: OutlineButton(onPressed: (){
          Navigator.pop(context);
        },
        borderSide: BorderSide(
          color: Color(0xff006FB4)
        ),
          child: Text('Close', style: TextStyle(color: Colors.black),),
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
      key: scaffoldKey,
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

