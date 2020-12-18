import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {

  AnimationController controller;

  Animation<Color> colorAnimation;
  Animation<double> sizeAnimation;
  Animation curve;


  bool favorited = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration:Duration(milliseconds: 300),
      vsync:this
    );

    curve = CurvedAnimation(
        parent:controller,
        curve:Curves.easeInOut
    );

    colorAnimation = ColorTween(begin:Colors.grey[400],end:Colors.red).animate(curve);
    sizeAnimation = TweenSequence(
        <TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
            tween:Tween<double>(begin:30,end:50),
            weight:50
          ),

          TweenSequenceItem<double>(
              tween:Tween<double>(begin:50,end:30),
              weight:50
          ),
        ]
    ).animate(curve);


    controller.addListener(() {
    });

    controller.addStatusListener((status) {
      if(status == AnimationStatus.completed)
        {
          favorited = true;
        }
      if(status == AnimationStatus.dismissed)
        {

          favorited = false;

        }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation:controller,
      builder:(BuildContext context,_)
      {
       return IconButton(
         icon: Icon(
           Icons.favorite,
           color: colorAnimation.value,
           size: sizeAnimation.value,
         ),
         onPressed: () {

           favorited?controller.reverse():controller.forward();
         },
       );
      },
    );
  }
}
