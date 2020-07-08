import 'dart:typed_data';

import 'package:app_manager/app_memo.dart';
import 'package:app_manager/google_map.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Information extends StatefulWidget {
  final Application appInfo;
  final Uint8List appIcon;

  const Information({Key key, @required this.appInfo, this.appIcon})
      : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  bool _editMode = false;

  void _toggleViewType() {
    setState(() {
      _editMode = !_editMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _style = Theme.of(context)
        .textTheme
        .display1
        .apply(color: Color.fromRGBO(0, 0, 0, 0.9));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'App Info',
          style: GoogleFonts.kanit(
            textStyle: TextStyle(
              decoration: TextDecoration.none,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.mode_edit),
            onPressed: () => _toggleViewType(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.appInfo.appName,
                  style: GoogleFonts.kanit(
                    textStyle: _style,
                  ),
                ),
                AppMemo(appInfo: widget.appInfo, editMode: _editMode),
                Center(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 50,
                          height: 50,
                          child: Image.memory(widget.appIcon)),
                    ),
                  ),
                ),
              ],
            )),
      ),
      floatingActionButton: _editMode
          ? FloatingActionButton(
              child: Icon(Icons.place),
              onPressed: () {
                Navigator.push(
                  this.context,
                  MaterialPageRoute(
                    builder: (context) => GoogleMap(),
                  ),
                );
              },
            )
          : null,
    );
  }
}
