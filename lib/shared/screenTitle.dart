import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;

  const ScreenTitle({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration:Duration(milliseconds: 500),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 36,
            color: Colors.grey[100],
            fontWeight: FontWeight.bold),
      ),
      tween:Tween<double>(
        begin:0,
        end:1
      ),
      curve: Curves.easeIn,
      builder:(BuildContext context,double val,Widget child)
      {
        return Opacity(
        opacity:val,
        child:Padding(
          padding:EdgeInsets.only(top:val*25),
          child:child
        )
        );

      },
    );
  }
}
