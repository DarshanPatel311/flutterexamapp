import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AddScreen.dart';

Container SaveContenor() {
  return Container(
    height: 30,
    width: 100,
    decoration: BoxDecoration(
        color: Color(0xff003C43),
        borderRadius: BorderRadius.circular(10)
    ),child: Center(child: Text('Save',style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  ),)),
  );
}
Widget namebox() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(25, 20, 20, 0),
    child: Container(

        height: 50,
        width: 400,
        decoration: BoxDecoration(
            color: Color(0xff77B0AA),
            borderRadius: BorderRadius.circular(10)),
        child: TextField(
          controller: txtName,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)),
            hintText: 'Your Name',


          ),

        )),
  );
}

Widget GRIDbox() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(25, 20, 20, 0),
    child: Container(

        height: 50,
        width: 400,
        decoration: BoxDecoration(
            color: Color(0xff77B0AA),
            borderRadius: BorderRadius.circular(10)),
        child: TextField(
          controller: txtGRID,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)),
            hintText: 'Your GRID',


          ),

        )),
  );
}

Widget StdBox() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(25, 20, 20, 0),
    child: Container(

        height: 50,
        width: 400,
        decoration: BoxDecoration(
            color: Color(0xff77B0AA),
            borderRadius: BorderRadius.circular(10)),
        child: TextField(
          controller: txtSTD,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)),
            hintText: 'Your STD',


          ),

        )),
  );
}