import 'package:flutter/material.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({
    WidgetBuilder? builder,
    RouteSettings? settings,
  }) : super(
          builder: builder!,
          settings: settings,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    
    return super
        .buildTransitions(context, animation, secondaryAnimation, child);
  }
}
