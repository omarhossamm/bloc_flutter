import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/Add_item/Additem_states.dart';
import 'package:mobile_shop/Home_page/Homepage_event.dart';
import 'package:mobile_shop/Home_page/Homepage_states.dart';
import 'package:mobile_shop/Model/item.dart';
import 'package:mobile_shop/Repository/Homepage_repository.dart';

class Homepagebloc extends Bloc<Homepageevent, Homepagestates> {
  Homepagerepository repo;
  Homepagebloc(Homepagestates initialState, this.repo) : super(initialState);

  @override
  Stream<Homepagestates> mapEventToState(Homepageevent event) async* {
    if (event is Getdataevent) {
      yield loading_state();
      List<Itemmodel> response;
      response = await repo.getdata();

      List<String> response1 = [];

      for (int i = 0; i < response.length; i++) {
        response1.add(await repo.getImage_repo(response[i].item_pic));
        
      }
response1.asMap();
      yield fetchdata_state(data: response, name: response1);
    }
  }
}
