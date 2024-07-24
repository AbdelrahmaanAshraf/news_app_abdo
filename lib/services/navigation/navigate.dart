
import 'package:flutter/material.dart';

class Navigate {
  static void push (context, screen){
    Navigator.push(context,MaterialPageRoute(builder:(context) => screen));
  }
  static void pop (context ,screen){
    Navigator.pop(context,MaterialPageRoute(builder:(context) => screen));
  }
}