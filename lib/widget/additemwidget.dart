import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/Add_item/Additem_bloc.dart';
import 'package:mobile_shop/Add_item/Additem_event.dart';
import 'package:mobile_shop/Add_item/Additem_states.dart';

// ignore: camel_case_types
class additemwedget extends StatelessWidget {
  
 additemwedget({Key key});

  @override
  Widget build(BuildContext context) {
  File _image;
    return Container(
      child: BlocBuilder<Additembloc, Additemstates>(builder: (context, states) {
      if (states is getimagestate) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            height: 200,
            width: 200,
            child: Center(
                child: _image == null
                    ? IconButton(
                        icon: Icon(Icons.add_sharp),
                        onPressed: () {},
                      )
                    : GestureDetector(
                        onTap: () {
                          BlocProvider.of<Additembloc>(context)
                              .add(Getimageevent());
                        },
                        child: Image.file(
                          states.cimage,
                          fit: BoxFit.cover,
                        ))),
          )),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            height: 200,
            width: 200,
            child: Center(
                child: _image == null
                    ? IconButton(
                        icon: Icon(Icons.add_sharp),
                        onPressed: () {},
                      )
                    : GestureDetector(
                        onTap: () {
                          BlocProvider.of<Additembloc>(context)
                              .add(Getimageevent());
                        },
                      )),
          )),
        );
      }
    }),
    );
  }
}