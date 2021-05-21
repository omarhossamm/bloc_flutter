import 'package:mobile_shop/Model/item.dart';
import 'package:mobile_shop/Repository/Homepage_repository.dart';

abstract class Homepagestates {}

// ignore: camel_case_types
class initiat_state extends Homepagestates {}
// ignore: camel_case_types
class loading_state extends Homepagestates {}
// ignore: camel_case_types
class fetchdata_state extends Homepagestates {
  List<Itemmodel> data;
  List<String> name;
  fetchdata_state({this.data , this.name});
}

class Getimagestate extends Homepagestates{
 String name;
 Getimagestate({this.name});
}
