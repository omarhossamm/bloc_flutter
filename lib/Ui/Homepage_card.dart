import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_shop/Add_item/Additem_states.dart';
import 'package:mobile_shop/Home_page/Homepage_states.dart';

// ignore: must_be_immutable
class Homecart extends StatelessWidget {
  fetchdata_state states;
  Homecart({this.states});

  @override
  Widget build(BuildContext context) {
    Future<String> image_url(String name) async {
      final ref = FirebaseStorage.instance.ref().child(name);

      String url = await ref.getDownloadURL();

      return url;
    }

    return GridView.builder(
      itemCount: states.data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) {
        return Card(
          
            elevation: 2.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: GridTile(
              
              footer: GridTileBar(
                title: Text(
                  states.data[i].item_name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 7.0),
                  child: Text(
                    states.data[i].item_price + ' EG',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                backgroundColor: Colors.black54,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: GestureDetector(
                  

                  onTap: () {
                    // detailes of products screen
                  },
                  child: Image.network(
                    
                    states.name[i],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ));
      },
    );
  }
}
