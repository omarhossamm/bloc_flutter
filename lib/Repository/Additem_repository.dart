import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/item.dart';

class Additemrepository {
  var db = FirebaseFirestore.instance.collection("emp");

  // ignore: non_constant_identifier_names
  Postdbb(Itemmodel itemmodel) async {
    await db.add(itemmodel.tomap());
  }
}
