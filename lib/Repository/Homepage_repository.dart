import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../Model/item.dart';

class Homepagerepository {
  var db = FirebaseFirestore.instance.collection("emp");
  Future<List<Itemmodel>> getdata() async {
    var response = await db.get();
    var responseob =
        response.docs.map((e) => Itemmodel.fromMap(e.data())).toList();

    return responseob;
  }
  Future<String> getImage_repo(String name) async{
    
    final ref = FirebaseStorage.instance.ref().child("product").child(name);
    var url =  await ref.getDownloadURL();

    return url;
  }
}
