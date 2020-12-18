import 'package:flutter/material.dart';

class demo extends StatefulWidget {
  @override
  _demoState createState() => _demoState();
}

class _demoState extends State<demo> {

  double margin = 0;
  double width = 200;
  Color color = Colors.red;
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedContainer(
        duration:Duration(seconds:2),
        margin:EdgeInsets.all(margin),
        color:color,
        width:width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            RaisedButton(
              onPressed: () => { setState(() => margin=50) },
              color:Colors.white,
              textColor: Colors.black,
              child:Text(
                "Margin"
              )
            ),
            RaisedButton(
                onPressed: () => { setState(() => color=Colors.black) },
                color:Colors.white,
                textColor: Colors.black,
                child:Text(
                    "color"
                )
            ),
            RaisedButton(
                onPressed: () => { setState(() => opacity=0) },
                color:Colors.white,
                textColor: Colors.black,
                child:Text(
                    "opacity"
                )
            ),
            AnimatedOpacity(
                opacity: opacity,
                duration: Duration(seconds: 2),
                child:Text(
                "WATCH ME DISSAPEAR",
                    style:TextStyle(
                      color:Colors.white,
                    )
            )
            )
          ],
        )
    )

    );
  }
}
