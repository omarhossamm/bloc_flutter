import 'dart:io';

abstract class Additemstates{}

// ignore: camel_case_types
class initiat_state extends Additemstates{}
class Addstate extends Additemstates{}
class Addimagephonestate extends Additemstates{}

// ignore: camel_case_types
class getimagestate extends Additemstates {
File cimage;
getimagestate({this.cimage});
}

class imagesuccessstate extends Additemstates{
  File image;
  imagesuccessstate({this.image});
}