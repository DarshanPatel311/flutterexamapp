import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterexamapp/AddScreen/AddScreen.dart';
import 'package:flutterexamapp/utils/list.dart';

import '../utils/Global.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff135D66),
        child: Icon(Icons.add,size: 40,color: Colors.black,),
        onPressed: () {
         setState(() {
           Navigator.pushNamed(context, '/AddScreen');
         });
        },
      ),
      backgroundColor: Color(0xffE3FEF7),
      appBar: AppBar(
        backgroundColor: Color(0xff135D66),
        title: Text('Student Potel',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(

          children: [

           ...List.generate(l1.length, (index) =>  Studentbox(index),),
           ...List.generate(1, (index) =>  (imgpath==null)?Container():Studentbox1(index),),

            ],
        ),
      ),
    );
  }
  Widget Studentbox1(int index) {

    return Column(
      children: [
        SizedBox(height: 10,),
        ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text('Student Name :${Name}'),
                Text('GRID : ${GRID}'),
                Text('STD : ${STD}'),
              ],
            ),
            trailing: IconButton(onPressed: () {
             setState(() {
               imgpath==null;
               Navigator.pushNamed(context, '/AddScreen');
             });
            }, icon: Icon(Icons.edit_note_sharp,color: Colors.red,)),
            tileColor: Color(0xff77B0AA),
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff0000),

              ),
              child: Center(
                child:  (imgpath==null)?Image.asset(''):Image.file(imgpath!,fit: BoxFit.fill,),
              ),



            )),
      ],
    );
  }
  Widget Studentbox(int index) {

    return Column(
      children: [
        SizedBox(height: 10,),
        ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('Student Name :${l1[index]['Name']}'),
                  Text('GRID : ${l1[index]['GRID']}'),
                  Text('STD : ${l1[index]['STD']}'),

                ],
              ),
               trailing: IconButton(onPressed: () {

               }, icon: Icon(Icons.edit_note_sharp,color: Colors.red,)),

             tileColor: Color(0xff77B0AA),
             leading: Container(
               height: 50,
               width: 50,
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 color: Color(0xff0000),

               ),
               child: Center(
                child: Image.asset(l1[index]['img']),
               ),


               )),
      ],
    );
  }
}
