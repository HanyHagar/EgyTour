import 'package:flutter/material.dart';

class NavigatorMethods {
  static void push({required BuildContext context ,required Widget nextPage}){
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => nextPage,
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0), // Start from right
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
      ),
    );
  }
  static void pushReplacement({required BuildContext context ,required Widget nextPage}){
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => nextPage,
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0), // Start from right
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
      ),
    );

  }

  static void pop({required BuildContext context}){
    Navigator.pop(context);

  }


}