import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

import '../utils/Global.dart';
import 'Componnets.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

TextEditingController txtName = TextEditingController();
TextEditingController txtGRID = TextEditingController();
TextEditingController txtSTD = TextEditingController();

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff135D66),
        title: Text(
          'Student Input',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          namebox(),
          GRIDbox(),
          StdBox(),
          InkWell(
            onTap: () {
              setState(() {
                setImage();
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Icon(
                Icons.add_a_photo_outlined,
                size: 35,
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  Name = txtName.text;
                  GRID = txtGRID.text;
                  STD = txtSTD.text;
                  Navigator.pop(context);
                });
              },
              child: SaveContenor(),
            ),
          ),
          RepaintBoundary(
            key: imagkey,
            child: Container(
              height: 200,
              width: 200,
              child: (imgpath == null)
                  ? Icon(Icons.add)
                  : Image.file(
                      imgpath!,
                      fit: BoxFit.fill,
                    ),
            ),
          ),
          TextButton(
              onPressed: () {
                setState(() async {
                  RenderRepaintBoundary? boundray = imagkey.currentContext!
                      .findRenderObject() as RenderRepaintBoundary;
                  ui.Image image = await boundray.toImage();
                  ByteData? bytedata =
                      await image.toByteData(format: ui.ImageByteFormat.png);
                  imgdata = bytedata!.buffer.asUint8List();
                  ImageGallerySaver.saveImage(imgdata!,
                      name: 'poster', quality: 100);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Save'),));
                });
              },
              child: Text('Save Img'))
        ],
      ),
    );
  }

  void setImage() async {
    XFile? images = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imgpath = File(images!.path);
    });
  }
}

ImagePicker picker = ImagePicker();
File? imgpath;
GlobalKey imagkey=GlobalKey();

