import 'package:flutter/material.dart';

class MyHours extends StatelessWidget {
  int hours;

  MyHours({required this.hours});

  @override
  Widget build(BuildContext) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        child: Center(
          child: Text(
          hours.toString(),
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
      
          
        ),),),
      ),
    );
  }
}
