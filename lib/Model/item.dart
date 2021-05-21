class Itemmodel {
  
  // ignore: non_constant_identifier_names
  String item_name , item_pic , item_price;

  // ignore: non_constant_identifier_names
  Itemmodel({this.item_name, this.item_pic ,this.item_price});

  tomap() => {
        'item_name': item_name,
        'item_pic' : item_pic,
        'item_price': item_price,
      };

  Itemmodel.fromMap(Map<String, dynamic> map)
      : item_name = map['item_name'],
      item_pic = map['item_pic'],
        item_price = map['item_price'];
        
}
