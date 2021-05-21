import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/Add_item/Additem_event.dart';
import 'package:mobile_shop/Add_item/Additem_states.dart';
import 'package:mobile_shop/Model/item.dart';
import 'package:mobile_shop/Repository/Additem_repository.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';

class Additembloc extends Bloc<Additemevent, Additemstates> {
  Additemrepository repo;
  Additembloc(Additemstates initialState, this.repo) : super(initialState);

  @override
  Stream<Additemstates> mapEventToState(Additemevent event) async* {
    if (event is Addevent) {
      repo.Postdbb(Itemmodel(
          item_name: event.item_name,
          item_pic: event.item_pic,
          item_price: event.item_price));

      yield Addstate();
    } else if (event is Getimageevent) {
      // ignore: deprecated_member_use
      final picker = ImagePicker();
      final pickedFile = await picker.getImage(source: ImageSource.gallery);

      File cimage;
      if (pickedFile != null) {
        cimage = File(pickedFile.path);
      } else {}
      //cimage = image;
      yield getimagestate(cimage: cimage);
    }
  }
}
