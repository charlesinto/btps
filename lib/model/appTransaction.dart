

import 'package:btps/model/transactDetail.dart';
import 'package:flutter/cupertino.dart';

class AppTransaction{
  final String date;
  List<TransactionDetail> detail = [];
  AppTransaction({@required this.date, this.detail});
}