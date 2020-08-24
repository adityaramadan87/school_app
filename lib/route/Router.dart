import 'package:flutter/material.dart';

class Router<T> extends MaterialPageRoute<T> {
  Router({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);
  
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    
    if (settings.isInitialRoute){
      return child;
    }
    return new SlideTransition(
      position: Tween(
          begin: Offset(1.0, 0.0),
          end: Offset(0.0,0.0)).animate(animation),
      child: child,
    );
  }
  
}