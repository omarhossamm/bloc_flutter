import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/Home_page/Homepage_bloc.dart';
import 'package:mobile_shop/Home_page/Homepage_event.dart';
import 'package:mobile_shop/Home_page/Homepage_states.dart';
import 'package:mobile_shop/Ui/Additem_ui.dart';
import 'package:mobile_shop/Ui/Homepage_card.dart';

class Homepagescreen extends StatefulWidget {
  static const String routname = '/Homepagescreen';
  Homepagescreen({Key key}) : super(key: key);

  @override
  _HomepagescreenState createState() => _HomepagescreenState();
}

class _HomepagescreenState extends State<Homepagescreen> {
  @override
  void initState() {
    BlocProvider.of<Homepagebloc>(context).add(Getdataevent());
  //  BlocProvider.of<Homepagebloc>(context).add(Getimageevent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Up date"),
        actions: [
          IconButton(
              icon: Icon(Icons.add_sharp),
              onPressed: () {
                Navigator.of(context).pushNamed(Additemui.routName);
              })
        ],
      ),
      body: BlocBuilder<Homepagebloc, Homepagestates>(
        builder: (context, states) {
          if (states is initiat_state) {
            return Center(child: CircularProgressIndicator());
          } else if (states is loading_state) {
            return Center(child: CircularProgressIndicator());
          } else if (states is fetchdata_state) {
            return Padding(
                padding: EdgeInsets.all(10.0),
                child: Homecart(
                  states: states,
                ));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    ));
  }
}
