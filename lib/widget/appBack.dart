
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBackArrow extends StatelessWidget{
  final Function onPress;
  final Color color;
  double size = 32;
  AppBackArrow({@required this.onPress,@required this.color, this.size});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: IconButton(icon: Icon(Icons.arrow_back, color: color, size: size,), onPressed: () => onPress()),
    );
  }
}