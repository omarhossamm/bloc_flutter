import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_shop/Add_item/Additem_bloc.dart';
import 'package:mobile_shop/Add_item/Additem_event.dart';
import 'package:mobile_shop/Add_item/Additem_states.dart';
import 'package:mobile_shop/Ui/Homepage_screen.dart';

class Additemui extends StatefulWidget {
  static const routName = "/Additem_ui";

  Additemui({Key key}) : super(key: key);

  @override
  _AdditemuiState createState() => _AdditemuiState();
}

class _AdditemuiState extends State<Additemui> {
  final _price = FocusNode();
  final _detailes = FocusNode();
  var _formkey = GlobalKey<FormState>();
  var _name = TextEditingController();
  var _cost = TextEditingController();
  var _pic = TextEditingController();
  File _image;
  @override
  void dispose() {
    _price.dispose();
    _detailes.dispose();
    _name.dispose();
    _cost.dispose();
    _pic.dispose();

    super.dispose();
  }






  Future<String> uploadItemImage(File mFileImage) async {
    final Reference storageReference = 
       FirebaseStorage.instance.ref().child("product");
  
    TaskSnapshot taskSnapshot = await 
      storageReference.child(mFileImage.path.split('/').last)
        .putFile(mFileImage);
    
    var downloadUrl = await taskSnapshot.ref.getDownloadURL();

    return downloadUrl;
}



// Future<String> image_url(String name) async{
// final ref = FirebaseStorage.instance.ref().child('product').child(name);

// var url = await ref.getDownloadURL();
// return url;
// }




  onsave() {
    final validate = _formkey.currentState.validate();
    if (!validate) {
      return;
    }
    _formkey.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<Additembloc, Additemstates>(
        listener: (context, state) {
          if (state is Addstate) {
            Navigator.of(context).pushNamed(Homepagescreen.routname);
          } else if (state is getimagestate) {
            _image = state.cimage;
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Container(
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                height: 200,
                                width: 200,
                                child: Center(child:
                                    BlocBuilder<Additembloc, Additemstates>(
                                        builder: (context, state) {
                                  if (state is getimagestate) {
                                    return GestureDetector(
                                        onTap: () {
                                          BlocProvider.of<Additembloc>(context)
                                              .add(
                                                  Getimageevent(image: _image));
                                        },
                                        child: 
                                        _image != null ?
                                        Image.file(
                                          _image,
                                          fit: BoxFit.cover,
                                        ) :
                                        Center(child: Text("Click me to add image"),)
                                        );
                                  } else {
                                    return IconButton(
                                      icon: Icon(Icons.add_sharp),
                                      onPressed: () {
                                        BlocProvider.of<Additembloc>(context)
                                            .add(Getimageevent(image: _image));
                                      },
                                    );
                                  }
                                }))))),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: _name,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_price);
                        },
                        maxLines: null,
                        decoration:
                            InputDecoration(labelText: 'Name of product'),
                        validator: (value) {
                          if (value.length == 0) {
                            return 'please add mobile name';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: _cost,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_detailes);
                        },
                        focusNode: _price,
                        textInputAction: TextInputAction.next,
                        maxLines: null,
                        decoration: InputDecoration(
                          labelText: 'Price',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.length == 0) {
                            return 'Please add mobile cost';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: _pic,
                        focusNode: _detailes,
                        textInputAction: TextInputAction.done,
                        maxLines: null,
                        decoration: InputDecoration(
                          labelText: 'Detailes of product',
                        ),
                        onFieldSubmitted: (_) {
                          onsave();
                        },
                        validator: (value) {
                          if (value.length == 0) {
                            return null;
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(50.0),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: () {
                          String x = _image.path.split('/').last;
                           BlocProvider.of<Additembloc>(context).add(Addevent(
                               item_name: _name.text,
                               item_pic: x,
                               item_price: _cost.text));





 uploadItemImage(_image);




 
      


                        },
                        color: Colors.cyan,
                        child: Text("Upload"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
