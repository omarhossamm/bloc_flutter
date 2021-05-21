import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/Add_item/Additem_bloc.dart';
import 'package:mobile_shop/Repository/Additem_repository.dart';
import 'package:mobile_shop/Add_item/Additem_states.dart' as additemstate;
import 'package:mobile_shop/Ui/Additem_ui.dart';
import 'package:mobile_shop/Ui/Homepage_screen.dart';

// ignore: camel_case_types
class Home_screen extends StatefulWidget {
  static const String routname = '/homescreen';
   Home_screen({Key key}) : super(key: key);

  @override
  _Home_screenState createState() => _Home_screenState();
}

// ignore: camel_case_types
class _Home_screenState extends State<Home_screen> {
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) {
              return Additembloc(additemstate.initiat_state(), Additemrepository());
            },
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Homepagescreen(),
          routes: {
            Additemui.routName: (ctx) => Additemui(),
            Homepagescreen.routname: (ctx) => Homepagescreen(),
            Home_screen.routname: (ctx) => Home_screen(),
          },
        ));
  }
}
