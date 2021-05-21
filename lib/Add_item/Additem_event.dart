import 'dart:io';

abstract class Additemevent {}

class Addevent extends Additemevent {
  // ignore: non_constant_identifier_names
  String item_name, item_pic, item_price;
  // ignore: non_constant_identifier_names
  Addevent({this.item_name, this.item_pic, this.item_price});
}

class Addimagephoneevent extends Additemevent {}

class Getimageevent extends Additemevent {
  File image;
  Getimageevent({this.image});
}

class imagesuccessevent extends Additemevent {
  File image;
  imagesuccessevent(this.image);
}
